require 'spec_helper'

describe Promocat do
  	let(:promoact) { FactoryGirl.create(:promoact) }
	let(:category) { FactoryGirl.create(:category) }
	let(:promocat) { promoact.promocats.build(category_id: category.id) }

	subject { promocat }

	it { should be_valid }

	describe "promoact methods" do

		it { should respond_to(:promoact) }
		it { should respond_to(:category) }
		its(:promoact) { should eq promoact }
		its(:category) { should eq category }
	end

	describe "when promoact id is not present" do
		before { promocat.promoact_id = nil }
		it { should_not be_valid }
	end

	describe "when category id is not present" do
		before { promocat.category_id = nil }
		it { should_not be_valid }
	end
end
