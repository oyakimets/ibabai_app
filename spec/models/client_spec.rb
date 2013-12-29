require 'spec_helper'

describe Client do

	before do
		@client = Client.new(name: "Elefant", contacts: "these are contacts for LLC Elefant")
	end

	subject { @client }

	it { should respond_to(:name) }
	it { should respond_to(:contacts) }
end
