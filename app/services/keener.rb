class Keener
  def follow(suggestion:)
    options = {
      tuid: suggestion.tuid,
      screen_name: suggestion.screen_name,
      slug: suggestion.slug
    }

    Keen.publish(:follow, options)
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
        Keen.publish(:new_session, options)
      end
    end

    def destroy
      { name: user.name, location: user.location }.tap do |options|
        Keen.publish(:destory_user, options)
      end
    end

    protected

    attr_reader :user
  end
end
