require 'spec_helper'

describe Formatt do
  before { @formatt = Formatt.create(name: "Fuckers") }
  subject { @formatt }

  it { should respond_to(:name) }
  it { should respond_to(:categories) }
  it { should respond_to(:catforms) }
 
  it { should be_valid }

  describe "when name is not present" do
  	before { @format.name = nil }
  	it { should_not be_valid }
  end
end

