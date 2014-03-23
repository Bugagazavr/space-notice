class Project < ActiveRecord::Base
  belongs_to :user
  has_many :subscriptions

  validates :user, :name, :token, presence: true

  def subscribe(device)
    subscriptions.where(device: device).first_or_create!
  end

  def unsubscribe(device)
    subscriptions.where(device: device).destroy_all
  end
end
