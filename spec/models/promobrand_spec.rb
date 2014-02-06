require 'spec_helper'

describe Promobrand do
	
	let(:promoact) { FactoryGirl.create(:promoact) }
	let(:brand) { FactoryGirl.create(:brand) }
	let(:promobrand) { promoact.promobrands.build(brand_id: brand.id) }

	subject { promobrand }

	it { should be_valid }

	describe "promobrand methods" do

		it { should respond_to(:promoact) }
		it { should respond_to(:brand) }
		its(:promoact) { should eq promoact }
		its(:brand) { should eq brand }
	end

	describe "when promoact id is not present" do
		before { promobrand.promoact_id = nil }
		it { should_not be_valid }
	end

	describe "when brand id is not present" do
		before { promobrand.brand_id = nil }
		it { should_not be_valid }
	end 
end
