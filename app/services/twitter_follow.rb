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
    users.each(&follow)
  rescue Twitter::Error::NotFound
    call unless done?
  rescue Twitter::Error => e
    statement.update_attribute(:error, TwitterErrorFactory.build(exception: e))
  ensure
    update_statement!
  end

  private

  def update_statement!
    @suggestions.any? ? save : statement.inactive!
  end

  def save
    statement.update_attributes!(
      ending_at: statement.duration.seconds.since, suggestions: @suggestions
    )
  end

  def done?
    @suggestions.size == @quantity
  end

  def follow
    ->(user) { done? ? break : add(user) }
  end

  def add(user)
    Suggestion.find_by(tuid: user.id).tap do |suggestion|
      Keener.new.follow(suggestion: suggestion)
      @suggestions << suggestion
    end
  end

  def users
    TwitterUsersToFollow.call(client: client, quantity: @quantity)
  end

  def client
    @client ||= TwitterClient.call(user_id: statement.user.id)
  end

  def statement
    @statement ||= Statement.find(@statement_id)
  end
end
