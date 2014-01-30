require 'spec_helper'

describe Promosegment do
  	let(:promoact) { FactoryGirl.create(:promoact) }
	let(:segment) { FactoryGirl.create(:segment) }
	let(:promosegment) { promoact.promosegments.build(segment_id: segment.id) }

	subject { promosegment }

	it { should be_valid }

	describe "segment methods" do

		it { should respond_to(:promoact) }
		it { should respond_to(:segment) }
		its(:promoact) { should eq promoact }
		its(:segment) { should eq segment }
	end

	describe "when promo action id is not present" do
		before { promosegment.promoact_id = nil }
		it { should_not be_valid }
	end

	describe "when segment id is not present" do
		before { promosegment.segment_id = nil }
		it { should_not be_valid }
	end
end

