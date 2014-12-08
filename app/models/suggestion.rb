class Suggestion < ActiveRecord::Base
  has_and_belongs_to_many :statements, dependent: :destroy

  scope :random, ->(number) { limit(number).order('RANDOM()') }
end
