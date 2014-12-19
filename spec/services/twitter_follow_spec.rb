require 'rails_helper'

describe TwitterFollow do
  subject(:twitter) do
    described_class.call(statement_id: statement.id, quantity: quantity)
  end

  let(:quantity) { 2 }
  let(:client) { instance_double('Twitter::REST::Client') }

  let!(:suggestion) { create(:suggestion) }
  let!(:statement) { create(:statement) }

  let(:twitter_user) do
    instance_double('Twitter::User', id: suggestion.tuid)
  end

  before do
    allow(TwitterClient).to receive(:call)
      .with(user_id: statement.user.id) { client }

    expect(client).to receive(:follow).with([twitter_user])
  end

  context 'when users to follow' do
    before do
      expect(TwitterUsersToFollow).to receive(:call)
        .with(client: client, quantity: quantity)
        .and_raise(Twitter::Error::NotFound)
        .and_return([twitter_user])

      twitter
    end

    it 'assigns suggestions to statement' do
      expect(statement.reload.suggestions).to eq([suggestion])
    end

    it 'sets ending at date for statement' do
      expect(statement.reload.ending_at).to be > DateTime.now
    end
  end

  context 'when done or no results' do
    let(:quantity) { 0 }

    before do
      expect(TwitterUsersToFollow).to receive(:call)
        .with(client: client, quantity: quantity)
        .and_return([twitter_user])

      twitter
    end

    it 'does not assign more than requested' do
      expect(statement.suggestions).to eq([])
    end

    it 'sets statement to inactive' do
      expect(statement.status).to eq('inactive')
    end
  end
end
