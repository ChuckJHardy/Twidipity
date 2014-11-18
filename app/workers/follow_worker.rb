class FollowWorker
  include Sidekiq::Worker

  def perform(id)
    puts "********** Follow Worker - #{id}"
  end
end
