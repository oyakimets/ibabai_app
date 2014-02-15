require 'clockwork'
require './config/boot'
require './config/environment'

include Clockwork


every 1.day, 'daily_customer.select', at: "00:00" do
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

every 5.minutes, 'daily_store.select' do
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