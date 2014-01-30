require 'spec_helper'

describe Prodcat do

	before { @prodcat = Prodcat.create(name: "Product Category") }

	subject { @prodcat }
	
	it { should respond_to(:name) }
	it { should respond_to(:promoacts) }
	it { should respond_to(:promoprods) }

	it { should be_valid } 

	describe "when name is not present" do
		before { @prodcat.name = nil }
		it { should_not be_valid }
	end
end
