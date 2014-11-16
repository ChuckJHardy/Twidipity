class InviteController < ApplicationController
  def index; end

  def new; end

  def create
    SubscribeWithEmailOrTwitter.call(
      controller: self,
      email: SubscribeWithEmail,
      twitter: SubscribeWithTwitter
    )
  end
end
