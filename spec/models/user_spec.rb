require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create_with_omniauth" do
    subject { described_class.create_with_omniauth auth: auth }

    let(:auth) { {} }

    it "calls off to service" do
      expect(CreateOmniauthUser).to receive(:call).with(auth: auth) { true }
      expect(subject).to be_truthy
    end
  end
end
