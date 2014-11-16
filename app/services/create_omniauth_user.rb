class CreateOmniauthUser
  def initialize(user: User.new, auth:)
    @user = user
    @auth = auth
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    set && user.save && user
  end

  protected

  attr_reader :user, :auth

  private

  def set
    user.uid = auth[:uid]
    assign_credentials && assign_info && assign_location
  end

  def assign_credentials
    user.token = credentials[:token]
    user.secret = credentials[:secret]
  end

  def assign_info
    user.name = info[:name]
    user.nickname  = info[:nickname]
    user.location  = info[:location]
  end

  def assign_location
    user.time_zone = raw[:time_zone]
    user.lang = raw[:lang]
  end

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
