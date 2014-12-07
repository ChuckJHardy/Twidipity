require 'rails_helper'

describe BuildFollowFromTwitterUser do
  subject(:builder) { described_class.call(user: mock_twitter_user) }

  let!(:mock_twitter_user) { build(:mock_twitter_user) }

  it 'returns follow object' do
    expect(builder).to be_an_instance_of(Follow)
  end

  it 'returns valid object' do
    expect(builder.valid?).to be_truthy
  end

  it 'sets tuid' do
    expect(builder.tuid).to eq(mock_twitter_user.id)
  end

  it 'sets name' do
    expect(builder.name).to eq(mock_twitter_user.name)
  end

  it 'sets screen name' do
    expect(builder.screen_name).to eq(mock_twitter_user.screen_name)
  end

  it 'sets profile image uri' do
    expect(builder.profile_image_uri).to eq(mock_twitter_user.profile_image_uri)
  end

  it 'sets uri' do
    expect(builder.uri).to eq(mock_twitter_user.uri)
  end
end
