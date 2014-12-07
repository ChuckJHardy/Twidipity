class UnfollowWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform(id)
    TwitterUnfollow.call(statement_id: id)
  end
end
