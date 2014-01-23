require 'spec_helper'

describe Actcity do
  	let(:action) { FactoryGirl.create(:action) }
	let(:city) { FactoryGirl.create(:city) }
	let(:actcity) { action.actcities.build(city_id: city.id) }

	subject { actcity }

	it { should be_valid }

	describe "action methods" do

		it { should respond_to(:action) }
		it { should respond_to(:city) }
		its(:action) { should eq action }
		its(:city) { should eq city }
	end

	describe "when action id is not present" do
		before { actcity.action_id = nil }
		it { should_not be_valid }
	end

	describe "when city id is not present" do
		before { actcity.city_id = nil }
		it { should_not be_valid }
	end
end

