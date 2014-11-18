class TwitterClient
  def initialize(user_id:)
    @user_id = user_id
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_api_key
      config.consumer_secret     = Rails.application.secrets.twitter_api_secret
      config.access_token        = user.token
      config.access_token_secret = user.secret
    end
  end

  private

  def user
    @user ||= User.find @user_id
  end
end
