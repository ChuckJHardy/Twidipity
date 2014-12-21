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
      statements.each(&refollow)
    end

    private

    def refollow
      lambda do |statement|
        destroy(statement)

        duplicate(statement).tap do |ns|
          FollowWorker.perform_async(ns.id, ns.follow)
        end
      end
    end

    def destroy(statement)
      statement.complete!
      UnfollowWorker.perform_async(statement.id)
    end

    def duplicate(statement)
      statement.dup.tap do |s|
        s.ending_at = nil
        s.active!
      end
    end

    def statements
      Statement.active.ended
    end
  end
end
