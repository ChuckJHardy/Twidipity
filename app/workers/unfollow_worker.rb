class UnfollowWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform(id)
    TwitterUnfollow.call id: id
  end
end
