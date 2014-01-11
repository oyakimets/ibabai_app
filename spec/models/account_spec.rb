require 'spec_helper'

describe Account do	
	before do
		@account = Account.new(name: "oleg", email: "oleg@gmail.com")
	end

	subject { @account }

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:user_list) }
	
	it { should be_valid }

	describe "user associations" do
		before { @account.save }
		let!(:older_user) do
			FactoryGirl.create(:user, account: @account, created_at: 1.day.ago)
		end
		let!(:newer_user) do
			FactoryGirl.create(:user, email: "name@iba.com", account: @account, created_at: 1.hour.ago)
		end

		it "should have right users in right order" do
			expect(@account.users.to_a).to eq [newer_user, older_user]
		end
	end
end
