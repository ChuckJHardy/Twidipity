require_relative '../../lib/twitter_error_factory'

class TwitterFollow
  def initialize(statement_id:, quantity: 1)
    @statement_id = statement_id
    @quantity = quantity.to_i
    @suggestions = []
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    follow && update
  rescue Twitter::Error => exception
    save_error(exception)
  end

  private

  def follow
    client.follow(users.each(&find))
  end

  def update
    update_statement! if @suggestions.any?
  end

  def save_error(exception)
    statement.update_attribute(
      :error, TwitterErrorFactory.build(exception: exception)
    )
  end

  def update_statement!
    statement.update_attributes!(
      status: Statement.statuses[:active],
      ending_at: statement.duration.seconds.since,
      suggestion: @suggestions.first
    )
  end

  def done?
    @suggestions.size == @quantity
  end

  def find
    ->(user) { done? ? break : add(user) }
  end

  def add(user)
    Suggestion.find_by(tuid: user.id).tap do |suggestion|
      KeenAdapter.friend(suggestion: suggestion, key: :follow)
      @suggestions << suggestion
    end
  end

  def users
    @users ||= TwitterUsersToFollow.call(client: client, quantity: @quantity)
  end

  def client
    @client ||= TwitterClient.call(user_id: statement.user.id)
  end

  def statement
    @statement ||= Statement.find(@statement_id)
  end
end
