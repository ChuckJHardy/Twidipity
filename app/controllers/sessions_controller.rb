class SessionsController < ApplicationController
  def create
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user
    @user ||= find_user || create_user
  end

  def find_user
    User.find_by(uid: auth[:uid])
  end

  def create_user
    User.create_with_omniauth(auth: auth)
  end

  def auth
    @auth ||= request.env['omniauth.auth']
  end
end
