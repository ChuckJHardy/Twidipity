class TwitterUnfollow
  def initialize(statement_id:)
    @statement_id = statement_id
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    client.unfollow(ids) && log
  end

  private

  def ids
    suggestions.pluck(:tuid)
  end

  def log
    suggestions.each { |suggestion| record_unfollow(suggestion) }
  end

  def client
    TwitterClient.call(user_id: statement.user.id)
  end

  def suggestions
    @suggestions ||= statement.suggestions
  end

  def statement
    @statement ||= Statement.find(@statement_id)
  end

  def record_unfollow(suggestion)
    options = {
      tuid: suggestion.tuid,
      screen_name: suggestion.screen_name,
      slug: suggestion.slug
    }

    Keen.publish(:unfollow, options)
  end
end
