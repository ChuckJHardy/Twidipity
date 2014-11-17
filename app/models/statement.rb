class Statement < ActiveRecord::Base
  enum status: [:inactive, :active]

  belongs_to :user
end
