require 'spec_helper'

describe Customer do	
  before { @customer = Customer.create( gender: "male", age: 25, income: "low", city_id: 1) }
  subject { @customer }

  it { should respond_to(:gender) }
  it { should respond_to(:age) }
  it { should respond_to(:income) }
  it { should respond_to(:city_id) }
  it { should respond_to(:promocustomers) }
  it { should respond_to(:promoacts) }
  
  it { should be_valid }

  describe "when gender is not present" do
  	before { @customer.gender = nil }
  	it { should_not be_valid }
  end

  describe "when age is not present" do
  	before { @customer.age = nil }
  	it { should_not be_valid }
  end
end

