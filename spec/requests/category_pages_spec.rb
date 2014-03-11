require 'spec_helper'

describe "Category pages" do

	subject { page }

	describe "new category path" do
		let(:user) { FactoryGirl.create(:user, client_id: 1, account_id: 1) }

		before do
			FactoryGirl.create(:formatt, name: "My-format")
			FactoryGirl.create(:chain, name: "My-chain")
			sign_in user
			visit new_category_path 
		end

    	it { should have_title("ibabai | trade categories") }
    	it { should have_content("add new category") }
    
    	let(:submit) { "Save" }

    	describe "with invalid information" do
    		it "should not create category" do
    			expect { click_button submit }.not_to change(Category, :count)    			
			end
		end

		describe "with valid information" do
			before do
				fill_in "trade category name", with: "My-category"
				find("#chains_id").select("My-chain")
				find("#formatts_id").select("My-format")				
			end

			it "should create category" do
    			expect { click_button submit }.to change(Category, :count).by(1)				
			end

			it "should create cat-format" do
				expect { click_button submit }.to change(Catform, :count).by(1)	
			end

			it "should create cat-chain" do
				expect{ click_button submit }.to change(Catchain, :count).by(1)
			end
		end		
	end

	describe "dropping category" do
		let(:user) { FactoryGirl.create(:user, client_id: 1, account_id: 1) }
		let(:category) { FactoryGirl.create(:category, user: user, name: "My cat") }
		before do
			sign_in user
			visit new_category_path
			find_link("drop").click
		end

		it { should_not have_content("My cat") }
	end
end
