class Project < ActiveRecord::Base
  belongs_to :user
  has_many :subscriptions, dependent: :destroy

  validates :user, :name, :token, presence: true

  def push(title, message, url)
    url = "https://space-notice.com" if url.blank?
    url = ProxyUrl.short(url)

    params = { body: message, title: name, url_args: [url] }
    params[:title] = title if title.present?

    subscriptions.includes(user: :devices).each do |subscription|
      subscription.user.devices.each do |device|
        Pusher.new(params.merge(device_token: device.token)).push
      end
    end
  end

  def push_payload(string)
    payload = JSON.parse(string)
    repo = payload["repository"]
    title   = "#{repo["owner_name"]}/#{repo["name"]}"
    message = "#{payload["branch"]}: #{payload["status_message"]}"

    if payload["type"] == "pull_request"
      url = "#{repo["url"]}/commit/#{payload["commit"]}"
    else
      url = "#{repo["url"]}/pull/#{payload["pull_request_number"]}"
    end
    push(title, message, url)
  end
end
