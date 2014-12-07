class TwitterFollow
  def initialize(statement_id:, quantity:)
    @statement_id = statement_id
    @quantity = quantity.to_i
    @follows = []
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    followed_users.map do |user|
      break if done?
      @follows << BuildFollowFromTwitterUser.call(user: user)
    end
  rescue Twitter::Error::NotFound
    call unless done?
  ensure
    statement.follows << @follows
  end

  private

  def followed_users
    client.follow(ids)
  end

  def done?
    @follows.size == @quantity
  end

  def ids
    @ids ||= RandomCollection.pluck(@quantity)
  end

  def client
    @client ||= TwitterClient.call(user_id: statement.user.id)
  end

  def statement
    @statement ||= Statement.find(@statement_id)
  end
end
