require 'spec_helper'

describe Category do
  let(:user) { FactoryGirl.create(:user, account_id: 1) }
	before { @category = user.categories.build(name: "Category1") }
	subject { @category }

	it { should respond_to(:name) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }
	its(:user) { should eq user }
	it { should respond_to(:catforms) }
	it { should respond_to(:catchains) }
	it { should respond_to(:formats) }
	it { should respond_to(:chains) }
	it { should respond_to(:actions) }
	it { should respond_to(:actcats)}

	it { should be_valid }

	describe "when name is not present" do
		before { @category.name = nil }
		it { should_not be_valid } 
	end

	describe "when user_id is not present" do
		before { @category.user_id = nil }
		it { should_not be_valid }
	end
end
