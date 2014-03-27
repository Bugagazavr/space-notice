class Project < ActiveRecord::Base
  belongs_to :user
  has_many :subscriptions

  validates :user, :name, :token, presence: true

  def push(message)
    subscriptions.includes(user: :devices).each do |subscription|
      subscription.user.devices.each do |device|
        Pusher.new(device_token: device.token, body: message).push
      end
    end
  end
end
