class Pusher
  def initialize(params)
    @pusher = new_pusher
    @notification = new_notification(params)
  end

  def push
    @pusher.push(@notification)
  end

  private
  def new_pusher
    Grocer.pusher(
      certificate: "#{Rails.root}/config/package/cert.pem",
      passphrase:  "",
      gateway:     "gateway.push.apple.com",
      port:        2195,
      retries:     3
    )
  end

  def new_notification(params)
    Grocer::SafariNotification.new({
      body:     'Hi',
      action:   'Read',
      url_args: []
    }.merge(params))
  end
end
