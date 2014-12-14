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
    expect(client).to receive(:follow).with([suggestion.tuid])
      .and_raise(Twitter::Error::NotFound)
      .and_return([twitter_user])

    twitter
    expect(statement.reload.suggestions).to eq([suggestion])
  end

  it 'sets ending at date' do
    allow(client).to receive(:follow) { [twitter_user] }

    twitter
    expect(statement.reload.ending_at).to be > DateTime.now
  end

  context 'when done or no results' do
    let(:quantity) { 0 }

    before do
      allow(client).to receive(:follow) { [twitter_user] }
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
