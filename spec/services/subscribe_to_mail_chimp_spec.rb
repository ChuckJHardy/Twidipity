require "rails_helper"

describe SubscribeToMailChimp do
  subject { described_class.call email: email }

  let(:email) { "twidipity+test@insert.coffee" }

  context "when successful" do
    it "returns subscription hash" do
      VCR.use_cassette("services/subscribe_to_mail_chimp/success") do
        expect(subject).to be_a Hash
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
