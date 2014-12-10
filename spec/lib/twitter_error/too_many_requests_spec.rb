require 'spec_helper'

require './lib/twitter_error_factory'
require './lib/twitter_error/too_many_requests'

describe TwitterError::TooManyRequests do
  subject(:twitter_error) { described_class.message(exception: exception) }

  let(:exception) do
    instance_double(
      'Twitter::Error::TooManyRequests',
      rate_limit: rate_limit
    )
  end

  let(:rate_limit) do
    instance_double(
      'Twitter::RateLimit',
      limit: 15,
      remaining: 0,
      reset_at: Time.parse('2014-01-01')
    )
  end

  it 'returns message' do
    expect(twitter_error).to eq(
      'TwitterError::TooManyRequests: 0/15 retry at 2014-01-01 00:00:00 +0000'
    )
  end
end
