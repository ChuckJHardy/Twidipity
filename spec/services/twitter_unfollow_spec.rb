require 'rails_helper'

describe TwitterUnfollow do
  subject(:twitter) { described_class.call(statement_id: follow.statement.id) }

  let!(:follow) { create :follow }
  let(:client) { Twitter::REST::Client.new }

  before do
    allow(TwitterClient).to receive(:call)
      .with(user_id: follow.statement.user.id) { client }
  end

  it 'unfollows expected follows' do
    expect(client).to receive(:unfollow).with([follow.tuid])
    twitter
  end
end
