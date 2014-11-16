class SubscribeWithTwitter
  def initialize address:, controller:
    @address = address
    @controller = controller
  end

  def self.call *args
    new(*args).call
  end

  def call
    @controller.redirect_to "/auth/twitter"
  end
end
