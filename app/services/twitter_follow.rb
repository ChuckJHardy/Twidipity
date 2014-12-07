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
    following.map do |follow|
      break if done?
      @follows << Follow.new(tuid: follow.id)
    end
  rescue Twitter::Error::NotFound
    call unless done?
  ensure
    statement.follows << @follows
  end

  private

  def following
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
