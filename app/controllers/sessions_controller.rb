class SessionsController < ApplicationController
  def create
    session[:user_id] = user.id unless user.inactive?
    redirect_to root_path, notice: ':)'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user
    User.find_by(uid: auth[:uid]) ||
      User.create_with_omniauth(auth: auth)
  end

  def auth
    @auth ||= request.env['omniauth.auth']
  end
end
