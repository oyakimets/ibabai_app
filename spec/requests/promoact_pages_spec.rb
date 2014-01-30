require 'spec_helper'

describe "Promoact pages" do
	subject { page }

  	describe "promo action pages" do
  		let(:user) { FactoryGirl.create(:user, account_id: 1, client_id: 1) }      
    	
    	before do
            FactoryGirl.create(:brand, name: "Brand", user_id: user.id)
    		sign_in user
    		visit new_promoact_path
    	end

    	it { should have_content("Customer segments") }
    	it { should have_title("ibabai | new promo action") }
        
        let(:submit) { "Save promo" }

        describe "with invalid input" do
            it "should not create promo" do
                expect{ click_button submit }.not_to change(Promoact, :count)
            end
        end

        describe "with valid input" do

            before do
                select "Brand", from: "brand"
                fill_in "promo name", with: "My promo"
                fill_in "start date", with: "2014-01-30"
            end

            it "should create a promo" do
                expect{ click_button submit }.to change(Promoact, :count).by(1)
            end
        end
    end
end