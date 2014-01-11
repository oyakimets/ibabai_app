require 'spec_helper'

describe "Brand pages" do

	subject { page }

	let(:client) { FactoryGirl.create(:client) }

	let(:user) { FactoryGirl.create(:user, client_id: client.id) }

	before { sign_in user }

	describe "brand creation" do
		before { visit user_path(user) }

		describe "with invalid information" do

			it "should not create a brand" do
				expect { click_button "Add" }.not_to change(Brand, :count)
			end

			describe "error message" do
				before { click_button "Add" }
				it { should have_content('error') }
			end
		end

		describe "with valid information" do
			before { fill_in "Add new brand.", with: "Loli-Pop" }
			it "should create a Brand" do
				expect { click_button "Add" }.to change(Brand, :count).by(1)
			end
		end
    end
end
