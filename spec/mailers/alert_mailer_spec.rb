require "spec_helper"

describe AlertMailer do
  describe "dropout_notification" do
    let(:mail) { AlertMailer.dropout_notification }

    it "renders the headers" do
      mail.subject.should eq("Dropout notification")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
