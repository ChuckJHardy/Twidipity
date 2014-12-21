require 'spec_helper'
require './app/decorators/application_decorator'
require './app/decorators/suggestion_decorator'

RSpec.describe SuggestionDecorator, type: :decorator do
  describe '#profile_image_uri' do
    subject(:decorator) { described_class.decorate(object) }

    let(:object) do
      instance_double(
        'Suggestion',
        profile_image_uri: profile_image_uri
      )
    end

    let(:profile_image_uri) { 'http://twitter.com/image_normal.png' }

    it 'returns image url' do
      expect(decorator.profile_image_uri).to eq(
        'http://twitter.com/image_200x200.png'
      )
    end
  end
end
