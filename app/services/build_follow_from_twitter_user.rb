class BuildFollowFromTwitterUser
  def initialize(user:)
    @user = user
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    Follow.new(
      tuid: user.id,
      name: user.name,
      screen_name: user.screen_name,
      profile_image_uri: profile_image_uri,
      uri: uri
    )
  end

  protected

  attr_reader :user

  private

  def uri
    user.uri.to_s
  end

  def profile_image_uri
    user.profile_image_uri.to_s
  end
end
