class Subscription < ActiveRecord::Base
  belongs_to :project

  validates :device, presence: true
end
