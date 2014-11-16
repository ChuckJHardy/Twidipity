class SubscribeWithEmailOrTwitter
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def initialize(controller:, email:, twitter:)
    @controller = controller
    @email = email
    @twitter = twitter
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    subscribe_service.call address: address, controller: @controller
  end

  private

  def subscribe_service
    if email?
      @email
    elsif twitter?
      @twitter
    else
      NullSubscription
    end
  end

  def email?
    address.match VALID_EMAIL_REGEX
  end

  def twitter?
    address.index('@').to_i.zero?
  end

  def address
    @controller.params[:address]
  end

  class NullSubscription
    def initialize(address:, controller:)
      @address = address
      @controller = controller
    end

    def self.call(*args)
      new(*args).call
    end

    def call
      @controller.redirect_to @controller.root_path, notice: ':('
    end
  end
end
