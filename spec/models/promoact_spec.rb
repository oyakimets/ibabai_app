require 'spec_helper'

describe Promoact do
  
  let(:user) { FactoryGirl.create(:user, client_id: 1, account_id: 1) }
  before { @promoact = user.promoacts.build(name: "Action1", start_date: Date.today + 7.days, finish_date: Date.today + 15.days, brand_id: 1) } 

  subject { @promoact }

  it { should respond_to(:name) }
  it { should respond_to(:start_date) }
  it { should respond_to(:finish_date) }
  it { should respond_to(:brand_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }
  it { should respond_to(:promosegments) }
  it { should respond_to(:segments) }
  it { should respond_to(:promocities) }
  it { should respond_to(:cities) }
  it { should respond_to(:categories) }
  it { should respond_to(:promocats) }
  it { should respond_to(:promofeedbacks) }
  it { should respond_to(:feedbacks) }
  it { should respond_to(:promoprods) }
  it { should respond_to(:prodcats) }
  it { should respond_to(:promobrands) }
  it { should respond_to(:brands) }
  it { should respond_to(:promorelations) }
  it { should respond_to(:past_promoacts) }
  it { should respond_to(:promocustomers) }
  it { should respond_to(:customers) }

  it { should be_valid }

  describe "when name is not present" do
  	before { @promoact.name = nil }
  	it { should_not be_valid }
  end

  describe "when start is not present" do
  	before { @promoact.start_date = nil }
  	it { should_not be_valid }
  end

  describe "when finish is not present" do
  	before { @promoact.finish_date = nil }
  	it { should be_valid }
  end

  describe "when brand is not present" do
  	before { @promoact.brand_id = nil }
  	it { should_not be_valid }
  end

   describe "when start date is not valid" do
  	before { @promoact.start_date = Date.today - 1.day }
  	it { should_not be_valid }
  end

   describe "when finish date is not valid" do
  	before { @promoact.finish_date = Date.today + 5.days }
  	it { should_not be_valid }
  end

end
