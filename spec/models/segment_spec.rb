require 'spec_helper'

describe Segment do
	let(:user) { FactoryGirl.create(:user, account_id: 1) }
	before { @segment = user.segments.build(name: "Segment1", gender: "male", age_min: 20, age_max: 30) }
	subject { @segment }

	it { should respond_to(:name) }
	it { should respond_to(:user_id) }
	it { should respond_to(:gender) }
	it { should respond_to(:age_max) }
	it { should respond_to(:age_min) }
	it { should respond_to(:user) }
	its(:user) { should eq user }
	it { should respond_to(:promosegments) }
	it { should respond_to(:promoacts) }

	it { should be_valid }

	describe "when name is not present" do
		before { @segment.name = nil }
		it { should_not be_valid } 
	end

	describe "when user_id is not present" do
		before { @segment.user_id = nil }
		it { should_not be_valid }
	end

	describe "when age range is fucked up" do
		before { @segment.age_max = 15 }
		it { should_not be_valid }
	end
end
