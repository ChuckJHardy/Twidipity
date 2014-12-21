class Suggestion < ActiveRecord::Base
  has_many :statements, dependent: :destroy

  scope :random, ->(number) { limit(number).order('RANDOM()') }
end
