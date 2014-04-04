require "spec_helper"

describe SupportMailer do
  describe "support_request" do
    let(:mail) { SupportMailer.support_request }

    it "renders the headers" do
      mail.subject.should eq("Support request")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
