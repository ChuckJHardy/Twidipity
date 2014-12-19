class StatementsController < ApplicationController
  before_action :find_statement, only: [:show, :destroy]

  def show
    return true unless @statement.error?
    redirect_to new_statement_path, notice: 'Twitter Said No'
  end

  def new
    user.statements.last.tap do |statement|
      redirect_to statement_path(statement) if statement.try(:active?)
    end

    @statement = Statement.new
  end

  def create
    statement = Statement.new statement_params

    if statement.active!
      FollowWorker.perform_async statement.id, statement_params[:follow]
      redirect_to statement
    else
      render :new
    end
  end

  def destroy
    @statement.inactive!
    UnfollowWorker.perform_async @statement.id
    redirect_to root_path
  end

  private

  def find_statement
    @statement = user.statements.find params[:id]
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def statement_params
    params.require(:statement)
      .permit(:follow, :duration)
      .merge(user_id: user_id)
  end

  def user
    @user ||= User.find user_id
  end

  def user_id
    session[:user_id]
  end
end
