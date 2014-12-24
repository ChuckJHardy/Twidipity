class StatementsController < ApplicationController
  before_action :find_statement, only: [:destroy]

  def index
    @active = user.statements.active.map(&StatementDecorator)
    @processing = user.statements.processing
  rescue
    @active = []
    @processing = []
  ensure
    @new_statement = Statement.new
  end

  def history
    @complete = complete.uniq.map(&SuggestionDecorator)
  end

  def create
    statement = Statement.new(statement_params)

    if statement.processing!
      FollowWorker.perform_async(statement.id, statement_params[:follow])
    end

    redirect_to root_path
  end

  def destroy
    user.statements.find(params[:id]).tap do |statement|
      statement.complete!
      UnfollowWorker.perform_async statement.id
    end

    redirect_to root_path
  end

  private

  def complete
    user.statements.complete.map(&:suggestion)
  end

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
