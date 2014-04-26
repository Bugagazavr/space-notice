class Project < ActiveRecord::Base
  belongs_to :user
  has_many :subscriptions, dependent: :destroy

  validates :user, :name, :token, presence: true

  def push(title, message, url)
    if url.present?
      url = ProxyUrl.short(url)
    end
    params = { body: message, title: name, url: url }
    params[:title] = title if title.present?

    subscriptions.includes(user: :devices).each do |subscription|
      subscription.user.devices.each do |device|
        Pusher.new(params.merge(device_token: device.token)).push
      end
    end
  end
end
