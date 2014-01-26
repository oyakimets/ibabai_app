require 'spec_helper'

describe Feedback do
  before { @feedback = Feedback.create(name: "Fb-test") }
  subject { @feedback }

  it { should respond_to(:name) }
  it { should respond_to(:actfeedbacks) }
  it { should respond_to(:actions) }
  
  it { should be_valid }

  describe "when name is not present" do
  	before { @feedback.name = nil }
  	it { should_not be_valid }
  end  
end
