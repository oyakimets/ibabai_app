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
end
