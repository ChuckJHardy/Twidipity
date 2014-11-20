require 'rails_helper'

RSpec.describe Statement, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:follows).dependent(:destroy) }

  describe '.status' do
    subject { described_class.statuses }

    let(:expected_statuses) { { 'inactive' => 0, 'active' => 1 } }

    it 'returns emum hash' do
      expect(subject).to eq(expected_statuses)
    end
  end
end
