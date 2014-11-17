class StatementsController < ApplicationController
  before_action :find_statement, only: [:show, :destroy]

  def show; end

  def new
    @statement = Statement.new
  end

  def create
    statement = Statement.new statement_params

    if statement.active!
      redirect_to statement
    else
      render :new
    end
  end

  def destroy
    @statement.inactive!
    redirect_to root_path
  end

  private

  def find_statement
    @statement = user.statements.find params[:id]
  end

  def statement_params
    params.require(:statement)
      .permit(:follow, :for)
      .merge(user_id: user_id)
  end

  def user
    @user ||= User.find user_id
  end

  def user_id
    session[:user_id]
  end
end
