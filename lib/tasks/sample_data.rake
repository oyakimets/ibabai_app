 namespace :db do 
 	desc "fill database with sample data"
 	task populate: :environment do
 		50.times do |n|
 		  		promoact_id = n + 1 
 				code_1 = rand(10..100)
 				code_2 = rand(10..100)
 				code_3 = rand(10..100)
 				brand_id = rand(11..21)
 				prodcat_id = rand(1..5) 							
 				Chart.create!( 
 							code_1: code_1,
 							code_2: code_2,
 							code_3: code_3,
 							promoact_id: promoact_id,
 							brand_id: brand_id,
 							prodcat_id: prodcat_id)
 			 			
 		end

 		100.times do 
 			age = rand(16..60)
 			city_id = rand(1..4)
 			gender = ["male", "female"].sample
 			income = ["low", "mid", "high"].sample
 			Customer.create!(
 							age: age,
 							gender: gender,
 							income: income,
 							city_id: city_id
 							)
 		end

 		50.times do |n|
 			name = "store_#{n+1}"
 			address = "address_#{n+1}"
 			format_id = rand(1..4)
 			chain_id = rand(1..5)
 			city_id = rand(1..4)
 			lat = "lat_#{n+1}"
 			lon = "lon_#{n+1}"
 				Store.create!(
 							name: name,
 							address: address,
 							format_id: format_id,
 							chain_id: chain_id,
 							city_id: city_id,
 							lat: lat,
 							lon: lon
 						)
 		end
 	end
 end