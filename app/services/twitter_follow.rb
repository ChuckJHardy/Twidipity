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
    followed_users.map { |user| done? ? break : add(user.id) }
  rescue Twitter::Error::NotFound
    call unless done?
  rescue Twitter::Error => e
    statement.update_attribute(:error, TwitterErrorFactory.build(exception: e))
  ensure
    update_statement!
  end

  private

  def add(tuid)
    Suggestion.find_by(tuid: tuid).tap do |suggestion|
      record_follow(suggestion)
      @suggestions << suggestion
    end
  end

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
    statement.duration.seconds.since
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

  def record_follow(suggestion)
    options = {
      tuid: suggestion.tuid,
      screen_name: suggestion.screen_name,
      slug: suggestion.slug
    }

    Keen.publish(:follow, options)
  end
end
