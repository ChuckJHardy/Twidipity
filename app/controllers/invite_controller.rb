class InviteController < ApplicationController
  def index; end
  def new; end

  def create
    Invite.create! handle: params[:handle]
    redirect_to params[:url]
  end
end
