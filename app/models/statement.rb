class Statement < ActiveRecord::Base
  enum status: [:inactive, :processing, :active, :complete]

  belongs_to :user
  belongs_to :suggestion

  scope :ended, ->(date = DateTime.now) { where('ending_at < ?', date) }
end
