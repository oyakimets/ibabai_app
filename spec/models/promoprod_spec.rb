require 'spec_helper'

describe Promoprod do
	let(:promoact) { FactoryGirl.create(:promoact) }
	let(:prodcat) { FactoryGirl.create(:prodcat) }
	let(:promoprod) { promoact.promoprods.build(prodcat_id: prodcat.id) }

	subject { promoprod }

	it { should be_valid }

	describe "promoprod methods" do

		it { should respond_to(:promoact) }
		it { should respond_to(:prodcat) }
		its(:promoact) { should eq promoact }
		its(:prodcat) { should eq prodcat }
	end

	describe "when promoact id is not present" do
		before { promoprod.promoact_id = nil }
		it { should_not be_valid }
	end

	describe "when prodcat id is not present" do
		before { promoprod.prodcat_id = nil }
		it { should_not be_valid }
	end #{__FILE__}"
end
