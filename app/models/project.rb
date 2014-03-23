class Project < ActiveRecord::Base
  belongs_to :user

  validates :user, :name, :token, presence: true
end
