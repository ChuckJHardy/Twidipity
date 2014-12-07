require 'rails_helper'

describe TwitterFollow do
  subject(:twitter_follow) do
    described_class.call(statement_id: id, quantity: quantity)
  end

  let(:id) { 1 }
  let(:quantity) { 2 }
  let(:user_id) { 4 }

  let(:statement) { Statement.new(user: user) }
  let(:user) { User.new(id: user_id) }
  let(:client) { Twitter::REST::Client.new }
  let(:collection) { [1, 9] }
  let(:followed) { [build(:mock_twitter_user), build(:mock_twitter_user)] }

  before do
    allow(Statement).to receive(:find).with(id) { statement }
    allow(TwitterClient).to receive(:call).with(user_id: user_id) { client }
    allow(RandomCollection).to receive(:pluck).with(quantity) { collection }

    expect(client).to receive(:follow).with(collection)
      .and_raise(Twitter::Error::NotFound)
      .and_return(followed)
  end

  it 'saves all the follows' do
    twitter_follow
    expect(statement.follows.map(&:tuid)).to eq(followed.map(&:id))
  end
end
