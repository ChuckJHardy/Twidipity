class User < ActiveRecord::Base
  enum role: [:inactive, :active, :admin]

  def self.create_with_omniauth(auth:)
    CreateOmniauthUser.call auth: auth
  end
end
