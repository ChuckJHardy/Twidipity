require 'rails_helper'

RSpec.describe Statement, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:suggestion) }

  describe '.status' do
    subject { described_class.statuses }

    let(:expected_statuses) do
      { 'inactive' => 0, 'active' => 1, 'complete' => 2 }
    end

    it 'returns emum hash' do
      expect(subject).to eq(expected_statuses)
    end
  end

  describe '.ended' do
    subject(:scope) { described_class.ended(date) }

    let!(:statement) do
      create(:statement_with_suggestion, suggestion_ending_at: ending_at)
    end

    let!(:ending_at) { DateTime.now + 2.days }
    let(:date) { DateTime.now + 3.days }

    it 'returns expected statements' do
      expect(scope.size).to eq(1)
    end

    context 'when no statements have ended' do
      let(:date) { DateTime.now + 1.days }

      it 'returns expected statements' do
        expect(scope.size).to eq(0)
      end
    end
  end
end
