require 'rails_helper'

RSpec.describe Suggestion, type: :model do
  it { should have_many(:statements).dependent(:destroy) }

  describe '.random' do
    subject(:scope) { described_class.random(2) }

    let(:expected_sql) do
      'SELECT  "suggestions".* FROM "suggestions"   ORDER BY RANDOM() LIMIT 2'
    end

    it 'returns expected sql' do
      expect(scope.to_sql).to eq(expected_sql)
    end
  end
end
