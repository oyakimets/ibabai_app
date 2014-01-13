require 'spec_helper'

describe Action do
  
  let(:brand) { FactoryGirl.create(:brand, user_id: 1) }
  before { @action = brand.actions.build(name: "Action1", start: Time.zone.now + 7.days, finish: Time.zone.now + 15.days) } 

  subject { @action }

  it { should respond_to(:name) }
  it { should respond_to(:start) }
  it { should respond_to(:finish) }
  it { should respond_to(:brand_id) }
  it { should respond_to(:brand) }
  its(:brand) { should eq brand }

  it { should be_valid }

  describe "when name is not present" do
  	before { @action.name = nil }
  	it { should_not be_valid }
  end

  describe "when start is not present" do
  	before { @action.start = nil }
  	it { should_not be_valid }
  end

  describe "when finish is not present" do
  	before { @action.finish = nil }
  	it { should be_valid }
  end

  describe "when brand is not present" do
  	before { @action.brand_id = nil }
  	it { should_not be_valid }
  end

   describe "when start date is not valid" do
  	before { @action.start = Date.today - 1.day }
  	it { should_not be_valid }
  end

   describe "when finish date is not valid" do
  	before { @action.finish = Time.zone.now + 5.days }
  	it { should_not be_valid }
  end

end
