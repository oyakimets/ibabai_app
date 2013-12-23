require 'spec_helper'

describe "Support page" do
   
   it "should have right content " do
      visit '/support/user_support'
      expect(page).to have_content("This is a user support hub.")
   end

   it "should have right title" do
   		visit '/support/user_support'
   		expect(page).to have_title("ibabai | support")
   	end
end

