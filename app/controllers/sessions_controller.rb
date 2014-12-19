class SessionsController < ApplicationController
  def create
    Keener.new.user(user).create

    session[:user_id] = user.id
    redirect_to existing? ? statement_path(statement) : root_path
  end

  def failure
    redirect_to root_path, error: params[:message]
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def existing?
    statement.try(:active?)
  end

  def statement
    @statement ||= user.statements.last
  end

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
