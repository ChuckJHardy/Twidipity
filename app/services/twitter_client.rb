class TwitterClient
  def initialize(user_id:)
    @user_id = user_id
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    Twitter::REST::Client.new do |config|
      config.consumer_key        = secrets.twitter_app_key
      config.consumer_secret     = secrets.twitter_app_secret

      if user_id
        config.access_token        = user.token
        config.access_token_secret = user.secret
      end
    end
  end

  protected

  attr_reader :user_id

  private

  def user
    @user ||= User.find(@user_id)
  end

  def secrets
    Rails.application.secrets
  end
end
