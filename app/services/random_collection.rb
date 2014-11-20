class RandomCollection
  def initialize(number: number)
    @number = number
  end

  def self.pluck(number)
    new(number: number).pluck
  end

  def pluck
    @number.times.collect(&random)
  end

  private

  def random
    ->(_) { rand(first..last) }
  end

  def first
    Rails.application.secrets.twitter_id_start
  end

  def last
    Rails.application.secrets.twitter_id_end
  end
end
