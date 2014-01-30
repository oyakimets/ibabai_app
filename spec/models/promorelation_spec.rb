require 'spec_helper'

describe Promorelation do
	let(:promoact) { FactoryGirl.create(:promoact) }
	let(:past_promoact) { FactoryGirl.create(:promoact, status: 6) }
	let(:promorelation) { promoact.promorelations.build(past_promoact_id: past_promoact.id) }

	subject { promorelation }
	it { should be_valid }

	describe "promoact methods" do
		it { should respond_to(:promoact) }
		it { should respond_to(:past_promoact) }
		its(:promoact) { should eq promoact }
		its(:past_promoact) { should eq past_promoact }
	end

	describe "when promoact id is not present" do
		before { promorelation.promoact_id = nil }
		it { should_not be_valid }
	end

	describe "when past_promoact id is not present" do
		before { promorelation.past_promoact_id = nil }
		it { should_not be_valid }
	end
end
