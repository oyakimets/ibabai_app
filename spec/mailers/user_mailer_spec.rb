require "spec_helper"

describe UserMailer do
  before do
  	@user = FactoryGirl.create(:user)
  	@user.send_password_reset
  	@email_conf = UserMailer.deliveries.last
  end

  subject { @email_conf }

  it { should have_content("ignore this email") }
  its(:from) { should eq ["us@ibabai.com"] }
  its(:to) { should eq [@user.email] }
  its(:subject) { should eq "Password Reset" }

end
