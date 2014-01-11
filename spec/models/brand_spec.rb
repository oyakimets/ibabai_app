require 'spec_helper'

describe Brand do

  let(:user) { FactoryGirl.create(:user) }
  before { @brand = user.brands.build(name: "lolipop") }
  
	subject { @brand }

	it { should respond_to(:name) }
	it { should respond_to(:user_id) }
	it { should respond_to(:prodcat_id) }
	it { should respond_to(:dropped) }
	it { should respond_to(:user) }
	its(:user) { should eq user }

	it { should be_valid }

	describe "when user_id is not present" do
		before { @brand.user_id = nil }
		it { should_not be_valid }
	end
end

