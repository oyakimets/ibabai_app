require 'spec_helper'

describe Actfeedback do
  	let(:action) { FactoryGirl.create(:action) }
	let(:feedback) { FactoryGirl.create(:feedback) }
	let(:actfeedback) { action.actfeedbacks.build(feedback_id: feedback.id) }

	subject { actfeedback }

	it { should be_valid }

	describe "action methods" do

		it { should respond_to(:action) }
		it { should respond_to(:feedback) }
		its(:action) { should eq action }
		its(:feedback) { should eq feedback }
	end

	describe "when action id is not present" do
		before { actfeedback.action_id = nil }
		it { should_not be_valid }
	end

	describe "when feedback id is not present" do
		before { actfeedback.feedback_id = nil }
		it { should_not be_valid }
	end
end
