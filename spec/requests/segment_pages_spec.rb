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
    		visit new_segment_path
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
	end
end
