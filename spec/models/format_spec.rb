require 'spec_helper'

describe Format do
  before { @format = Format.create(name: "Fuckers") }
  subject { @format }

  it { should respond_to(:name) }
  it { should respond_to(:categories) }
  it { should respond_to(:catforms) }
  it { should respond_to(:actions) }
  it { should respond_to(:actformats) }

  it { should be_valid }

  describe "when name is not present" do
  	before { @format.name = nil }
  	it { should_not be_valid }
  end
end

