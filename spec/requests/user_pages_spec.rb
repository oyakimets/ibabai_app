require 'spec_helper'

describe "User pages" do
	subject { page }

	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }
		let(:client) { FactoryGirl.create(:client) }
		before { visit user_path(user) }

		it { should have_content(user.name) }
		it { should have_title("ibabai | #{user.name}") }
	end

	describe "signup page" do
		before { visit signup_path }

		it { should have_content('Sign up') }
		it { should have_title('ibabai | signup')}

		let(:submit) { "Create account" }
		

		describe "with invalid information" do
			it "should not create a user" do
				expect{ click_button submit }.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			let!(:client) { FactoryGirl.create(:client) }
			before do
				
				fill_in "name", with: "Oleg Ya"
				fill_in "email", with: "oleg@ibabai.com"
				select "Elefant", from: "company"
				fill_in "phone", with: "123456789098"
				fill_in "mobile", with: "123456789012"
				fill_in "password", with: "foobar"
				fill_in "confirmation", with: "foobar"
			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end
		end
	end
 end

