class CreateOmniauthUser
  def initialize user: User.new, auth:
    @user = user
    @auth = auth
  end

  def self.call *args
    new(*args).call
  end

  def call
    user.uid       = auth[:uid]
    user.token     = credentials[:token]
    user.secret    = credentials[:secret]
    user.name      = info[:name]
    user.nickname  = info[:nickname]
    user.location  = info[:location]
    user.time_zone = raw[:time_zone]
    user.lang      = raw[:lang]

    user.save && user
  end

  protected
  attr_reader :user, :auth

  private

  def credentials
    auth[:credentials]
  end

  def info
    auth[:info]
  end

  def raw
    extra[:raw_info]
  end

  def extra
    auth[:extra]
  end
end
