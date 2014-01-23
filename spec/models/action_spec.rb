require 'spec_helper'

describe Action do
  
  let(:user) { FactoryGirl.create(:user, client_id: 1, account_id: 1) }
  before { @action = user.actions.build(name: "Action1", start: Date.today + 7.days, finish: Date.today + 15.days, brand_id: 1) } 

  subject { @action }

  it { should respond_to(:name) }
  it { should respond_to(:start) }
  it { should respond_to(:finish) }
  it { should respond_to(:brand_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }
  it { should respond_to(:chains) }
  it { should respond_to(:actchains) }
  it { should respond_to(:formats) }
  it { should respond_to(:actformats) }
  it { should respond_to(:actsegments) }
  it { should respond_to(:segments) }
  it { should respond_to(:actcities) }
  it { should respond_to(:cities) }

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
