require 'spec_helper'

describe Actcat do
  	let(:action) { FactoryGirl.create(:action) }
	let(:category) { FactoryGirl.create(:category) }
	let(:actcat) { action.actcats.build(category_id: category.id) }

	subject { actcat }

	it { should be_valid }

	describe "action methods" do

		it { should respond_to(:action) }
		it { should respond_to(:category) }
		its(:action) { should eq action }
		its(:category) { should eq category }
	end

	describe "when action id is not present" do
		before { actcat.action_id = nil }
		it { should_not be_valid }
	end

	describe "when category id is not present" do
		before { actcat.category_id = nil }
		it { should_not be_valid }
	end
end
