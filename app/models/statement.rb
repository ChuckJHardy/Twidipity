class Statement < ActiveRecord::Base
  enum status: [:inactive, :active]

  belongs_to :user
  has_many :follows, dependent: :destroy
end
