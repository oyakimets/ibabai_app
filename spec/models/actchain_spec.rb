require 'spec_helper'

describe Actchain do
  	let(:action) { FactoryGirl.create(:action) }
	let(:chain) { FactoryGirl.create(:chain) }
	let(:actchain) { action.actchains.build(chain_id: chain.id) }

	subject { actchain }

	it { should be_valid }

	describe "action methods" do

		it { should respond_to(:action) }
		it { should respond_to(:chain) }
		its(:action) { should eq action }
		its(:chain) { should eq chain }
	end

	describe "when action id is not present" do
		before { actchain.action_id = nil }
		it { should_not be_valid }
	end

	describe "when chain id is not present" do
		before { actchain.chain_id = nil }
		it { should_not be_valid }
	end
end

