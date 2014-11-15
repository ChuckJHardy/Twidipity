class User < ActiveRecord::Base
  def self.create_with_omniauth auth:
    CreateOmniauthUser.call auth: auth
  end
end
