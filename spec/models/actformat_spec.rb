require 'spec_helper'

describe Actformat do
	let(:action) { FactoryGirl.create(:action) }
	let(:format) { FactoryGirl.create(:format) }
	let(:actformat) { action.actformats.build(format_id: format.id) }

	subject { actformat }

	it { should be_valid }

	describe "action methods" do

		it { should respond_to(:action) }
		it { should respond_to(:format) }
		its(:action) { should eq action }
		its(:format) { should eq format }
	end

	describe "when action id is not present" do
		before { actformat.action_id = nil }
		it { should_not be_valid }
	end

	describe "when chain id is not present" do
		before { actformat.format_id = nil }
		it { should_not be_valid }
	end
end


  
