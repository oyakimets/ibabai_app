require 'spec_helper'

describe Actsegment do
  	let(:action) { FactoryGirl.create(:action) }
	let(:segment) { FactoryGirl.create(:segment) }
	let(:actsegment) { action.actsegments.build(segment_id: segment.id) }

	subject { actsegment }

	it { should be_valid }

	describe "segment methods" do

		it { should respond_to(:action) }
		it { should respond_to(:segment) }
		its(:action) { should eq action }
		its(:segment) { should eq segment }
	end

	describe "when action id is not present" do
		before { actsegment.action_id = nil }
		it { should_not be_valid }
	end

	describe "when segment id is not present" do
		before { actsegment.segment_id = nil }
		it { should_not be_valid }
	end
end

