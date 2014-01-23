require 'spec_helper'

describe "Segment pages" do

	subject { page }
	describe "testing routs" do
		let(:user) { FactoryGirl.create(:user, account_id: 1) }
		before do
			sign_in user
			click_link "Segments"
		end

		it { should have_title("ibabai | customer segments") }
		it { should have_content("my segments") }
		
    end
    describe "new segment page" do
    	let(:user) { FactoryGirl.create(:user, account_id: 1) } 

    	before do
    		sign_in user
    		visit cust_seg_path
    	end

    	it { should have_title("ibabai | customer segments") }
		it { should have_content("my segments") }

		let(:submit) { "Save" }

		describe "with invalid input" do
			it "should not create segment" do
				expect{ click_button submit }.not_to change(Segment, :count)
			end
		end

		describe "with valid input" do
			before do
				fill_in "segment name", with: "Oleg's segment"
				select "female", from: "gender"
				select 18, from: "from age"
				select 30, from: "to age"
				select "high", from: "income level"
			end

			it "should create a segment" do
				expect { click_button submit }.to change(Segment, :count).by(1)
			end
		end

		describe "with the same user same name" do
			let(:user) { FactoryGirl.create(:user, account_id: 1) }
			
			before do
				FactoryGirl.create(:segment, user: user, name: "mySegment")
				sign_in user
				visit cust_seg_path
				fill_in "segment name", with: "mySegment"
			end

			it "should not create a segment" do
				expect { click_button submit }.not_to change(Segment, :count)
			end
		end

		describe "with the same name other user" do
			let(:user) { FactoryGirl.create(:user, account_id: 1) }
			let(:other_user) { FactoryGirl.create(:user, account_id: 2) }
			before do
				FactoryGirl.create(:segment, user: other_user, name: "mySegment")
				sign_in user
				visit cust_seg_path
				fill_in "segment name", with: "mySegment"
			end

			it "should create a segment" do
				expect { click_button submit }.to change(Segment, :count).by(1)
			end
		end
	end
end
