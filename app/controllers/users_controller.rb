class UsersController < ApplicationController
  def destroy
    user.delete
    redirect_to logout_path
  end

  private

  def user
    User.find(params[:id])
  end
end
