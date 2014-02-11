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
 	end
 end