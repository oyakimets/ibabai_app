require 'clockwork'
require './config/boot'
require './config/environment'

include Clockwork


every 1.day, 'daily_customer.select', at: "00:00" do
	Promoact.where("status = ?", 3).each do |pa|
		if pa.start_date >= Date.today
			pa.update_column(:status, 5)
		end
	end
	Promoact.where("status = ?", 5).each do |promoact|
		promoact.segments.each do |segment|
			if segment.gender.blank?
				gender_ar = ["male", "female"]
			else 
				gender_ar = [segment.gender]
			end
			if segment.income.blank?
				income_ar = ["low", "mid", "high"]
			else
				income_ar = [segment.income]
			end
			if promoact.cities.empty?
				cities_ar = City.all.collect { |c| c.id }
			else
				cities_ar = promoact.city_ids
			end				
			promo_cust = Customer.where("gender IN (?) AND age >= ? AND age <= ? AND income IN (?) AND city_id IN (?)", gender_ar, segment.age_min, segment.age_max, income_ar, cities_ar)
			promo_cust.each do |customer|
				promoact.promocustomers.create!( customer_id: customer.id, city_id: customer.city_id, segment_id: segment.id )
			end
		end
	end	
end

every 1.day, 'daily_store.select', at: "01:00" do
	Promoact.where("status = ?", 5).each do |promoact|
		promoact.categories.each do |category|
			if category.format_ids.empty?
				form_ar = Format.all.collect { |f| f.id }
			else
				form_ar = category.format_ids
			end

			if category.chain_ids.empty?
				chain_ar = Chain.all.collect { |c| c.id }
			else
				chain_ar = category.chain_ids
			end
			if promoact.cities.empty?
				cities_ar = City.all.collect { |c| c.id }
			else
				cities_ar = promoact.city_ids
			end							
			promo_store = Store.where("format_id IN (?) AND chain_id IN (?) AND city_id IN (?)", form_ar, chain_ar, cities_ar)
			promo_store.each do |store|
				promoact.promostores.create!( store_id: store.id, city_id: store.city_id, category_id: category.id )
			end
		end
	end	
end

every 1.hour, 'chart table update' do
	
	Promoact.where("status = ?", 5).each do |promoact|
		feedback_arr = [:fc_1, :fc_2, :fc_3]
		code_arr = [:code_1, :code_2, :code_3]
		feedback_arr.each do |fc|
			i=feedback_arr.index(fc)
			feedback_data = CustLog.fb_register(promoact.id, fc).count 
			Chart.find_by(promoact_id: promoact.id).update_column(code_arr[i], feedback_data)
		end

		if promoact.finish_date <= Date.today || Chart.code_3 >= promoact.contact_limit
			promoact.update_column(:status, 6)
		end
	end
end



	