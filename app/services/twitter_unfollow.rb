class TwitterUnfollow
  def initialize(id:)
    @id = id
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    client.unfollow [290097288, 15754281]
  end

  private

  def client
    TwitterClient.call user_id: statement.user.id
  end

  def statement
    Statement.find @id
  end
end
