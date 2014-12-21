require 'spec_helper'
require './app/decorators/application_decorator'
require './app/decorators/statement_decorator'
require './app/decorators/suggestion_decorator'

RSpec.describe StatementDecorator, type: :decorator do
  describe '#suggestion' do
    subject(:decorator) { described_class.decorate(object) }

    let(:object) do
      instance_double(
        'Statement',
        suggestion: double
      )
    end

    it 'returns decorated suggestion' do
      expect(decorator.suggestion).to be_an_instance_of(SuggestionDecorator)
    end
  end
end

