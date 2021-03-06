FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "alibaba #{n}" }
		sequence(:email) { |n| "ali_#{n}@ibabai.com" }
		client_id 1
		tel1 "123456789012"
		tel2 "123456789034"
		password "foobar"
		password_confirmation "foobar"
		pas_reset_token "12345"
		pas_reset_sent_at Time.zone.now
		account			
			
	end

	factory :client do
		sequence(:name) { |n| "Elefant_#{n}" }
		contacts "These are contacts for LLC Elefant"
	end

	factory :account do
		name "Le Me"
		email "acc@ibabai.com"
	end

	factory :brand do
		sequence(:name) { |n| "Lolipop_#{n}" }
		prodcat_id 1
		client_id 1
		user
	end		

	factory :prodcat do
		sequence(:name) { |n| "Prodcat_#{n}" }
	end

	factory :segment do
		sequence(:name) { |n| "Segment_#{n}" }
		user
	end

	factory :category do
		sequence(:name) { |n| "Category_#{n}" }
		user
	end

	factory :formatt do
		sequence(:name) { |n| "Format_#{n}" }
	end

	factory :chain do
		sequence(:name) { |n| "Chain_#{n}" }
	end

	factory :promoact do
		sequence(:name) { |n| "Action_#{n}" }
		brand_id 1
		start_date Date.today + 7.days
		status 1
		finish_date Date.today + 15.days
		client_id 1
		user
	end

	factory :city do
		sequence(:name) { |n| "City_#{n}" }
		population 500000
	end

	factory :feedback do
		sequence(:name) { |n| "Fb_#{n}" }
	end

	factory :customer do 
		gender "male"
		age 33
		income "mid"
		city_id 1
	end
end
