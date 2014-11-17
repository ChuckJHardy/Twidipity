class User < ActiveRecord::Base
  enum role: [:inactive, :active, :admin]

  has_many :statements

  def self.create_with_omniauth(auth:)
    CreateOmniauthUser.call auth: auth
  end
end
