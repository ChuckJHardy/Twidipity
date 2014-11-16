require "rails_helper"

describe SubscribeWithEmail do
  subject { described_class.call address: email, controller: controller }

  let(:controller) { double("TestController", root_path: "/") }
  let(:email) { "twidipity+test@insert.coffee" }

  context "when successful" do
    it "calls off to MailChimp and redirects" do
      VCR.use_cassette("services/subscribe_to_mail_chimp/success") do
        expect(controller).to receive(:redirect_to).
          with(controller.root_path, notice: ":)")

        subject
      end
    end
  end

  context "when failure" do
    let(:email) { "invalid_email_address" }
    let(:msg) { "An email address must contain a single @" }

    it "raises error" do
      VCR.use_cassette("services/subscribe_to_mail_chimp/failure") do
        expect { subject }.to raise_error Gibbon::MailChimpError, msg
      end
    end
  end
end
