require 'spec_helper'

describe "auth" do

	subject { page }

	describe "signin page" do
		before { visit root_path }

		it { should have_content("Please sign in") }
		it { should have_title("ibabai | signin")}
     end

     describe "signin" do
     	before { visit root_path }

     	describe "with invalid information" do
     		before { click_button "Sign in" }

     		it { should have_selector('div.alert.alert-error') }
     	end

          describe "with valid information" do
               let(:user) { FactoryGirl.create(:user) }
               before do
                    fill_in "email", with: user.email.upcase
                    fill_in "password", with: user.password
                    click_button "Sign in"
               end

               it { should have_title("ibabai | status") }
               it { should_not have_button("Sign in") }

               describe "followed by signout" do
                    before { click_link "SignOut" }
                     it { should have_button "Sign in" }
               end
          end
     end

     describe "authorization" do
          describe "as wrong user" do
               let(:user) { FactoryGirl.create(:user) }
               let(:wrong_user) { FactoryGirl.create(:user, email:"wrong@example.com") }
               before { sign_in user, no_capybara: true }

               describe "submitting a GET request to the Users#edi action" do
                    before { get edit_user_path(wrong_user) }
                    specify { expect(response).to redirect_to(root_url) }
               end

               describe "submitting a PATCH request to the User#update action" do
                    before { patch user_path(wrong_user) }
                    specify { expect(response).to redirect_to(root_url) }
               end
          end

          describe "as non-admin user" do
               let(:user) { FactoryGirl.create(:user) }
               before { sign_in user, no_capybara: true }

               describe "submitting a GET request to Users#new action" do
                    before { get new_user_path }
                    specify { expect(response).to redirect_to(signout_url) }
               end

               describe "submitting a POST request to Users#create action" do

                    before { post users_path }
                    specify { expect(response).to redirect_to(signout_url) }
               end
          end
     end
end
