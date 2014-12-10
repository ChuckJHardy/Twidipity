require 'rails_helper'

describe TwitterFollow do
  subject(:twitter) do
    described_class.call(statement_id: statement.id, quantity: quantity)
  end

  let(:quantity) { 2 }
  let(:client) { double('TwitterClient') }

  let!(:suggestion) { create(:suggestion) }
  let!(:statement) { create(:statement) }

  let(:twitter_user) do
    instance_double('Twitter::User', id: suggestion.tuid)
  end

  before do
    allow(TwitterClient).to receive(:call)
      .with(user_id: statement.user.id) { client }
  end

  it 'assigns suggestions to statement' do
    expect(client).to receive(:follow)
      .with([suggestion.tuid])
      .and_raise(Twitter::Error::NotFound)
      .and_return([twitter_user])

    twitter

    expect(statement.suggestions).to eq([suggestion])
  end

  context 'when done' do
    let(:quantity) { 0 }

    it 'does not assign more than requested' do
      allow(client).to receive(:follow)
        .and_return([twitter_user])

      twitter

      expect(statement.suggestions).to eq([])
    end
  end
end
