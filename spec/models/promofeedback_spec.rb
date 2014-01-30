require 'spec_helper'

describe Promofeedback do
  	let(:promoact) { FactoryGirl.create(:promoact) }
	let(:feedback) { FactoryGirl.create(:feedback) }
	let(:promofeedback) { promoact.promofeedbacks.build(feedback_id: feedback.id) }

	subject { promofeedback }

	it { should be_valid }

	describe "promo action methods" do

		it { should respond_to(:promoact) }
		it { should respond_to(:feedback) }
		its(:promoact) { should eq promoact }
		its(:feedback) { should eq feedback }
	end

	describe "when promo action id is not present" do
		before { promofeedback.promoact_id = nil }
		it { should_not be_valid }
	end

	describe "when feedback id is not present" do
		before { promofeedback.feedback_id = nil }
		it { should_not be_valid }
	end
end
