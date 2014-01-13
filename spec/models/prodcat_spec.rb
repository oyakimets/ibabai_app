require 'spec_helper'

describe Prodcat do

	before { @prodcat = Prodcat.create(name: "Product Category") }

	subject { @prodcat }
	
	it { should respond_to(:name) }

	it { should be_valid } 
end
