class FollowWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform(id, quantity)
    TwitterFollow.call id: id, quantity: quantity
  end
end
