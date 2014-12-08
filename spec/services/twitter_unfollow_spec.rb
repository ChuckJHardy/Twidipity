require 'rails_helper'

describe TwitterUnfollow do
  subject(:twitter) { described_class.call(statement_id: statement.id) }

  let!(:statement) { create(:statement_with_suggestions) }
  let(:client) { Twitter::REST::Client.new }

  before do
    allow(TwitterClient).to receive(:call)
      .with(user_id: statement.user.id) { client }
  end

  it 'unfollows expected follows' do
    expect(client).to receive(:unfollow)
      .with(statement.suggestions.map(&:tuid))

    twitter
  end
end
