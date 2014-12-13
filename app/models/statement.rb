class Statement < ActiveRecord::Base
  enum status: [:inactive, :active]

  belongs_to :user
  has_and_belongs_to_many :suggestions, dependent: :destroy

  scope :ended, ->(date) { where('ending_at < ?', date || DateTime.now) }
end
