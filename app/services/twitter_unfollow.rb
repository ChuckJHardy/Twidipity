class TwitterUnfollow
  def initialize(statement_id:)
    @statement_id = statement_id
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    client.unfollow(ids)
  end

  private

  def ids
    statement.suggestions.pluck(:tuid)
  end

  def client
    TwitterClient.call(user_id: statement.user.id)
  end

  def statement
    @statement ||= Statement.find(@statement_id)
  end
end
