require 'spec_helper'

describe "User pages" do
	subject { page }

	describe "segment page" do
		let(:user) { FactoryGirl.create(:user, account_id: 1) }
		let(:other_user) { FactoryGirl.create(:user, account_id: 2) }

		before do
			FactoryGirl.create(:segment, user: user, name: "Lorem")
			FactoryGirl.create(:segment, user: user, name: "Ipsum")
			FactoryGirl.create(:segment, user: other_user, name: "Brand")
			sign_in user
			visit cust_seg_path
		end

		it { should have_content("Lorem") }
		it { should have_content("Ipsum") }
		it { should_not have_content("Brand") }
	end

	describe "dropping the segment" do
		let(:client) { FactoryGirl.create(:client) }
		let(:user) { FactoryGirl.create(:user, client_id: client.id, account_id: 1) }
    	before do
    		FactoryGirl.create(:segment, user: user, name: "Droppable") 
    		sign_in user
			visit cust_seg_path
			click_link "drop"
		end

		it { should_not have_content("Droppable") } 
	end

	describe "profile page" do
		let(:client) { FactoryGirl.create(:client) }
		let(:user) { FactoryGirl.create(:user, account_id: 1, client_id: client.id) }
		let(:other_user) { FactoryGirl.create(:user, account_id: 2, client_id: client.id) }
		before do
			FactoryGirl.create(:brand, user: user, name: "Lorem")
			FactoryGirl.create(:brand, user: user, name: "Ipsum")
			FactoryGirl.create(:brand, user: other_user, name: "Brand")
			sign_in user
			visit user_path(user)

		end

		it { should have_content("Lorem") }
		it { should have_content("Ipsum") }
		it { should_not have_content("Brand") }
	end

	describe "dropping the brand" do
		let(:client) { FactoryGirl.create(:client) }
		let(:user) { FactoryGirl.create(:user, client_id: client.id) }
    	before do
    		FactoryGirl.create(:brand, user: user, name: "Droppable") 
    		sign_in user
			visit user_path(user)
			click_link "drop"
		end

		it { should_not have_content("Droppable") } 
	end
	
	
	describe "admin page for users" do
		let(:client) { FactoryGirl.create(:client) }		
		let(:a_user) { FactoryGirl.create(:user, admin: true, client_id: client.id) } 
		let(:account1) { FactoryGirl.create(:account, email: a_user.email) }
		let(:account2) { FactoryGirl.create(:account, email: "boo@ibabai.com") }
		let!(:user1) { FactoryGirl.create(:user, account: account1) }
		let!(:user2) { FactoryGirl.create(:user, account: account1) }
		let!(:user3) { FactoryGirl.create(:user, account: account2) }

		before do
			sign_in a_user			
			visit users_path
		end

		it { should have_content(a_user.name) }
		it { should have_title("ibabai | my users") }
		it { should have_link("change") }

		describe "account's users" do
			it { should have_content('My users') }
			it { should have_content(user1.email) }
			it { should have_content(user2.email) }
			it { should_not have_content(user3.email) }
		end
	end
		
	
	describe " customized links for admin" do
		let(:user) { FactoryGirl.create(:user) }
		let(:a_user) { FactoryGirl.create(:user, admin: true) }

		describe "as non-admin user" do
			before { sign_in user }

			it { should have_link("New Action") }
			it { should_not have_link("New User") }
			it { should have_link("Profile") }
			it { should_not have_link("My users") }
		end

		describe "as admin user" do
			before { sign_in a_user }

			it { should have_link("New User") }
			it { should_not have_link("New Action") }
			it { should_not have_link("Profile") }
			it { should have_link("My users") }
		end
	end
	

	describe "signup page" do
		let(:client) { FactoryGirl.create(:client) }
		let(:user) { FactoryGirl.create(:user, admin: true) }
		let(:account) { FactoryGirl.create(:account, email: user.email) }
		
		
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
			
			before do
				
				fill_in "name", with: "Oleg Ya"
				fill_in "email", with: "oleg@ibabai.com"
				select client.name, from: "company"
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
		let(:client) { FactoryGirl.create(:client) }
		let(:user) { FactoryGirl.create(:user, client_id: client.id, account_id: 1) }
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
			it { should have_title("ibabai | password") }
			it { should have_selector('div.alert.alert-success') }
			specify { expect(user.reload.name).to eq new_name }
			specify { expect(user.reload.tel1).to eq new_phone }
		end
	end
 end

