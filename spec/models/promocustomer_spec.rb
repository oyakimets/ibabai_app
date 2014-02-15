require 'spec_helper'

describe Promocustomer do
  let(:segment)	{ FactoryGirl.create(:segment, user_id: 1) }
  let(:promoact) { FactoryGirl.create(:promoact, user_id: 1) }
  let(:customer) { FactoryGirl.create(:customer) }
  let(:promocustomer) { promoact.promocustomers.build(customer_id: customer.id, city_id: customer.city_id, segment_id: segment.id) }

  subject { promocustomer }

  it { should be_valid }

  describe "promocustomers methods" do
  	it { should respond_to(:promoact) }
  	it { should respond_to(:customer) }
  	it { should respond_to(:city_id) }
  	it { should respond_to(:segment_id) }
  	its(:promoact) { should eq promoact }
  	its(:customer) { should eq customer }
  end

  describe "when promoact id is not present" do
  		before { promocustomer.promoact_id = nil }
		it { should_not be_valid }
	end

	describe "when customer id is not present" do
  		before { promocustomer.customer_id = nil }
		it { should_not be_valid }
	end

	describe "when promocity id is not present" do
  		before { promocustomer.city_id = nil }
		it { should_not be_valid }
	end

	describe "when promoact id is not present" do
  		before { promocustomer.segment_id = nil }
		it { should_not be_valid }
	end
end
