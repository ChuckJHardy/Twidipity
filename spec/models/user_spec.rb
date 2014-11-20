require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:statements).dependent(:destroy) }

  describe '.role' do
    subject { described_class.roles }

    let(:expected_roles) { { 'inactive' => 0, 'active' => 1, 'admin' => 2 } }

    it 'returns emum hash' do
      expect(subject).to eq(expected_roles)
    end
  end

  describe '#create_with_omniauth' do
    subject { described_class.create_with_omniauth auth: auth }

    let(:auth) { {} }

    it 'calls off to service' do
      expect(CreateOmniauthUser).to receive(:call).with(auth: auth) { true }
      expect(subject).to be_truthy
    end
  end
end
