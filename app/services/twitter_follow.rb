require_relative '../../lib/twitter_error_factory'

class TwitterFollow
  def initialize(statement_id:, quantity:)
    @statement_id = statement_id
    @quantity = quantity.to_i
    @suggestions = []
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    followed_users.map do |user|
      break if done?
      @suggestions << Suggestion.find_by(tuid: user.id)
    end
  rescue Twitter::Error::NotFound
    call unless done?
  rescue Twitter::Error => e
    statement.update_attribute(:error, TwitterErrorFactory.build(exception: e))
  ensure
    update_statement!
  end

  private

  def update_statement!
    if @suggestions.any?
      statement.update_attributes!(
        ending_at: ending_at, suggestions: @suggestions
      )
    else
      statement.inactive!
    end
  end

  def ending_at
    DateTime.now + statement.duration.days
  end

  def followed_users
    client.follow(tuids)
  end

  def done?
    @suggestions.size == @quantity
  end

  def tuids
    @tuids ||= Suggestion.random(@quantity).map(&:tuid)
  end

  def client
    @client ||= TwitterClient.call(user_id: statement.user.id)
  end

  def statement
    @statement ||= Statement.find(@statement_id)
  end
end
