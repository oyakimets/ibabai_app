class CustomerSelectionJob
	def perform		
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
end
