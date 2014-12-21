class KeenAdapter
  def self.friend(*args)
    new.friend(*args)
  end

  def friend(suggestion:, key: :follow)
    options = {
      tuid: suggestion.tuid,
      screen_name: suggestion.screen_name,
      slug: suggestion.slug
    }

    Publisher.call(key: key, options: options)
  end

  def user(user)
    User.new(user: user)
  end

  class User
    def initialize(user:)
      @user = user
    end

    def create
      { name: user.name, location: user.location }.tap do |options|
        KeenAdapter::Publisher.call(key: :new_session, options: options)
      end
    end

    def destroy
      { name: user.name, location: user.location }.tap do |options|
        KeenAdapter::Publisher.call(key: :destroy_user, options: options)
      end
    end

    protected

    attr_reader :user
  end

  class Publisher
    def initialize(key:, options:)
      @key = key
      @options = options
    end

    def self.call(*args)
      new(*args).call
    end

    def call
      Keen.publish(@key, @options) if publish?
    end

    def publish?
      Rails.env.production?
    end
  end
end
