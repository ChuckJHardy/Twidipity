require 'spec_helper'

require './lib/twitter_error_factory'
require './lib/twitter_error/too_many_requests'

describe TwitterErrorFactory do
  subject(:factory) { described_class.build(exception: exception) }

  let(:exception) { instance_double('Twitter::Error::TooManyRequests') }

  it 'returns message from error class' do
    expect(factory).to eq(exception.to_s)
  end

  context 'when custom error object exists' do
    let(:exception) do
      double(class: 'Twitter::Error::TooManyRequests').as_null_object
    end

    it 'returns message from error class' do
      expect(factory).to include('TwitterError::TooManyRequests')
    end
  end
end
