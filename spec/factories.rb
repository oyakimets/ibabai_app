FactoryGirl.define do
	factory :user do
		name "Me Le"
		email "me@ibabai.com"
		client_id 1
		tel1 "123456789012"
		tel2 "123456789034"
		password "foobar"
		password_confirmation "foobar"
		pas_reset_token "12345"
		pas_reset_sent_at Time.zone.now
		client
	end

	factory :client do
		name "Elefant"
		contacts "These are contacts for LLC Elefant"
	end
end
