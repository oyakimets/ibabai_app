require 'spec_helper'

describe City do
  before { @city = City.create(name: "City1", population: 300000) }
  subject { @city }

  it { should respond_to(:name) }
  it { should respond_to(:population) }
  it { should respond_to(:actcities) }
  it { should respond_to(:actions) }
  
  it { should be_valid }

  describe "when name is not present" do
  	before { @city.name = nil }
  	it { should_not be_valid }
  end

  describe "when population is not present" do
  	before { @city.population = nil }
  	it { should_not be_valid }
  end
end

