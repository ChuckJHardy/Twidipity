class StatementDecorator < ApplicationDecorator
  def suggestion
    SuggestionDecorator.decorate(super)
  end
end
