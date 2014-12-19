class UsersController < ApplicationController
  def destroy
    unfollow && user.delete && log
    redirect_to logout_path
  end

  private

  def unfollow
    user.statements.active.each do |statement|
      statement.inactive!
      UnfollowWorker.perform_async statement.id
    end
  end

  def user
    @user ||= User.find(params[:id])
  end

  def log
    Keener.new.user(user).destroy
  end
end
