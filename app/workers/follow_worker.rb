class FollowWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform(id, quantity)
    TwitterFollow.call(statement_id: id, quantity: quantity)
  end

  class Scheduled
    def self.perform
      new.perform
    end

    def perform
      statements.each do |statement|
        FollowWorker.perform_async(statement.id, statement.follow)
      end
    end

    private

    def statements
      Statement.active.ended
    end
  end
end
