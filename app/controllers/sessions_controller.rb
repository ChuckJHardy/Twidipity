class SessionsController < ApplicationController
  def create
    session[:user_id] = user.id
    redirect_to root_path, notice: "Welcome #{user.name}"
  end

  private

  def user
    User.find(uid: auth[:uid]) ||
      User.create_with_omniauth(auth: auth)
  end

  def auth
    @auth ||= request.env["omniauth.auth"]
  end
end
