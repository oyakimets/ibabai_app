require 'spec_helper'

describe "password" do
    subject { page }

    describe "password update launch" do
       let(:user) { FactoryGirl.create(:user) } 
	   before do		  
		  visit signin_path
		  click_link "forgot password?"
	   end

       it { should have_title("ibabai | email confirmation") }
	   it { should have_content("Confirm your email") }
	   it { should have_button("Reset Password") }
	   it { should have_link("back to signin") }
    end


	describe "password change page" do
        let(:user) { FactoryGirl.create(:user) }
        
		before { visit edit_password_reset_path(user.pas_reset_token) }			
			
		
		it { should have_title("ibabai | password") }
		it { should have_content("Update Password") }
		it { should have_link("back to signin") }
		it { should have_button("Save") }
    

       

    	describe "timely password change" do
    		before do
    			fill_in "password", with: "alibaba"
    			fill_in "confirmation", with: "alibaba"
    			click_button "Save"
    		end

    		it { should have_selector("div.alert.alert-success") }
    		it { should have_content("Please sign in") }
    		it { should have_title("ibabai | signin") }
    	end

    	describe "invalid password information" do
    		before do
    		    fill_in "password", with: "alibaba"
    			fill_in "confirmation", with: "babaali"
    			click_button "Save"
    		end

    		it { should have_selector("div.alert.alert-error") }
    		it { should have_content("Update Password") }
    		it { should have_title("ibabai | password") }
    	end 
    end

     describe "late password change" do
        let(:user) { FactoryGirl.create(:user, pas_reset_sent_at: Time.zone.now - 3.hours) }
        before do
            visit edit_password_reset_path(user.pas_reset_token)
            fill_in "password", with: "alibaba"
            fill_in "confirmation", with: "alibaba"
            click_button "Save"
        end

        it { should have_selector("div.alert.alert-error") }
        it { should have_content("Confirm your email") }
    end
end
