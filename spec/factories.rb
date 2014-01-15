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
		user
	end

	factory :action do
		sequence(:name) { |n| "Action_#{n}" }
		brand_id 1
		start Time.zone.now + 7.days
		brand
	end

	factory :prodcat do
		sequence(:name) { |n| "Prodcat_#{n}" }
	end

	factory :segment do
		sequence(:name) { |n| "Segment_#{n}" }
		user
	end
end
