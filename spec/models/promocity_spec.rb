require 'spec_helper'

describe Promocity do
  	let(:promoact) { FactoryGirl.create(:promoact) }
	let(:city) { FactoryGirl.create(:city) }
	let(:promocity) { promoact.promocities.build(city_id: city.id) }

	subject { promocity }

	it { should be_valid }

	describe "promoact methods" do

		it { should respond_to(:promoact) }
		it { should respond_to(:city) }
		its(:promoact) { should eq promoact }
		its(:city) { should eq city }
	end

	describe "when promoact id is not present" do
		before { promocity.promoact_id = nil }
		it { should_not be_valid }
	end

	describe "when city id is not present" do
		before { promocity.city_id = nil }
		it { should_not be_valid }
	end
end

