require 'spec_helper'

describe Catchain do
  	let(:category) { FactoryGirl.create(:category, user_id: 1) }
	let(:chain) { FactoryGirl.create(:chain) }
	let(:catchain) { category.catchains.build(chain_id: chain.id) }

	subject { catchain }

	it { should be_valid }

	describe "category methods" do

		it { should respond_to(:category) }
		it { should respond_to(:chain) }
		its(:category) { should eq category }
		its(:chain) { should eq chain }
	end

	describe "when cat id is not present" do
		before { catchain.category_id = nil }
		it { should_not be_valid }
	end

	describe "when chain id is not present" do
		before { catchain.chain_id = nil }
		it { should_not be_valid }
	end
end

