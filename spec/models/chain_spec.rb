require 'spec_helper'

describe Chain do
  before { @chain = Chain.create(name: "Fuckers") }
  subject { @chain }

  it { should respond_to(:name) }
  it { should respond_to(:categories) }
  it { should respond_to(:actions) }
  it { should respond_to(:actchains) }

  it { should be_valid }

  describe "when name is not present" do
  	before { @chain.name = nil }
  	it { should_not be_valid }
  end
end
