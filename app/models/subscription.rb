class Subscription < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates :user, :project, presence: true
end
