require 'spec_helper'

describe "User pages" do
	subject { page }

	describe "'NEW' links" do
		let(:user) { FactoryGirl.create(:user) }
		let(:admin) { FactoryGirl.create(:user, admin: true) }

		describe "as non-admin user" do
			before { sign_in user }

			it { should have_link("New Action") }
			it { should_not have_link("New User") }
		end

		describe "as admin user" do
			before { sign_in admin }

			it { should have_link("New User") }
			it { should_not have_link("New Action") }
		end
	end



	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }
		let(:client) { FactoryGirl.create(:client) }
		before do
			sign_in user
			visit user_path(user)
		end

		it { should have_content(user.name) }
		it { should have_title("ibabai | #{user.name}") }
		it { should have_link("change") }
	end

	describe "signup page" do
		let(:user) { FactoryGirl.create(:user, admin: true) }
		before do
			sign_in user
			visit signup_path
		end

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

	describe "edit" do
		let(:user) { FactoryGirl.create(:user) }
		before do
			sign_in user
			visit edit_user_path(user)
		end

		describe "page" do
			it { should have_content("Update your profile") }
			it { should have_title("ibabai | update") }
			
		end

		describe "with invalid information" do
			before { click_button "Save changes" }
			it { should have_content('error') }
		end

		describe "with valid information" do
			let(:new_name) { "password" }
			let(:new_phone) { "000111222333"}
			before do
				fill_in "name", with: new_name
				fill_in "phone", with: new_phone
				fill_in "password", with: user.password
				fill_in "confirmation", with: user.password
				click_button "Save changes"
			end
			it { should have_title("ibabai | status") }
			it { should have_selector('div.alert.alert-success') }
			specify { expect(user.reload.name).to eq new_name }
			specify { expect(user.reload.tel1).to eq new_phone }
		end
	end
 end

