require 'spec_helper'

describe "Support page" do

	subject { page }

	before { visit help_path }
   
   it { should have_content("This is a user support hub.") }
   it { should have_title("ibabai | support") }
   
end

