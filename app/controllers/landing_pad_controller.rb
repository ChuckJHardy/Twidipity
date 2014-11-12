class LandingPadController < ApplicationController
  def index; end
  def invite; end

  def create
    SubscribeToMailChimp.call email: params[:email]
    flash[:notice] = "Check your email"
  rescue Gibbon::MailChimpError => exception
    flash[:error] = exception
  ensure
    redirect_to root_path
  end
end
