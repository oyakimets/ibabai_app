require 'spec_helper'

describe Catform do
	let(:category) { FactoryGirl.create(:category, user_id: 1) }
	let(:format) { FactoryGirl.create(:format) }
	let(:catform) { category.c_formats.build(format_id: format.id) }

	subject { catform }

	it { should be_valid }

	describe "category methods" do

		it { should respond_to(:category) }
		it { should respond_to(:format) }
		its(:category) { should eq category }
		its(:format) { should eq format }
	end

	describe "when cat id is not present" do
		before { catform.category_id = nil }
		it { should_not be_valid }
	end

	describe "when format id is not present" do
		before { catform.format_id = nil }
		it { should_not be_valid }
	end
end
