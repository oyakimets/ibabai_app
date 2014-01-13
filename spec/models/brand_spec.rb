require 'spec_helper'

describe Brand do
  let(:prodcat) { FactoryGirl.create(:prodcat) }
  let(:user) { FactoryGirl.create(:user) }
  before { @brand = user.brands.build(name: "lolipop", prodcat_id: prodcat.id) }
  
	subject { @brand }

	it { should respond_to(:name) }
	it { should respond_to(:user_id) }
	it { should respond_to(:prodcat_id) }
	it { should respond_to(:dropped) }
	it { should respond_to(:user) }
	its(:user) { should eq user }
	it { should respond_to(:prodcat) }
	its(:prodcat) { should eq prodcat }

	it { should be_valid }

	describe "when user_id is not present" do
		before { @brand.user_id = nil }
		it { should_not be_valid }
	end

	describe "when prodcat_id is not present" do
		before { @brand.prodcat_id = nil }
		it { should_not be_valid }
	end

end

