class TwitterFollow
  def initialize(id:, quantity:)
    @id = id
    @quantity = quantity
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    client.follow [290097288, 15754281]
  end

  private

  def client
    TwitterClient.call user_id: statement.user.id
  end

  def statement
    Statement.find @id
  end
end
