class TwitterUsersToFollow
  def initialize(client:, quantity:)
    @client = client
    @quantity = quantity
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    users.delete_if(&friends?)
  end

  protected

  attr_reader :client

  private

  def friends?
    ->(user) { client.friendship?(current_user, user) }
  end

  def current_user
    client.current_user
  end

  def users
    client.users(tuids)
  end

  def tuids
    Suggestion.random(@quantity).map(&:tuid)
  end
end
