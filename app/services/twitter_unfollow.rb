class TwitterUnfollow
  def initialize(statement_id:)
    @statement_id = statement_id
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    client.unfollow(suggestion.tuid)
    KeenAdapter.friend(suggestion: suggestion, key: :unfollow)
  end

  private

  def client
    TwitterClient.call(user_id: statement.user.id)
  end

  def suggestion
    @suggestion ||= statement.suggestion
  end

  def statement
    @statement ||= Statement.find(@statement_id)
  end
end
