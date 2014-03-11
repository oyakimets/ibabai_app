require 'spec_helper'

describe Catform do
	let(:category) { FactoryGirl.create(:category, user_id: 1) }
	let(:formatt) { FactoryGirl.create(:formatt) }
	let(:catform) { category.c_formats.build(formatt_id: formatt.id) }

	subject { catform }

	it { should be_valid }

	describe "category methods" do

		it { should respond_to(:category) }
		it { should respond_to(:formatt) }
		its(:category) { should eq category }
		its(:formatt) { should eq formatt }
	end

	describe "when cat id is not present" do
		before { catform.category_id = nil }
		it { should_not be_valid }
	end

	describe "when format id is not present" do
		before { catform.formatt_id = nil }
		it { should_not be_valid }
	end
end
