class Project < ActiveRecord::Base
  belongs_to :user
  has_many :notification_types

  validates :user, :name, presence: true
end
