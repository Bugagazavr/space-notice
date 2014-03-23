class User < ActiveRecord::Base
  has_many :projects

  after_create :create_seed_project

  def self.get_by_omniauth(omnihash)
    where(github_id: omnihash["uid"]).first || create! do |user|
      user.github_id = omnihash["uid"]
      user.username  = omnihash["info"]["nickname"]
    end
  end

  def self.push
    pusher = Grocer.pusher(
      certificate: "#{Rails.root}/config/package/cert.pem",      # required
      passphrase:  "",                       # optional
      gateway:     "gateway.push.apple.com", # optional; See note below.
      port:        2195,                     # optional
      retries:     3                         # optional
    )

    notification = Grocer::SafariNotification.new(
      device_token: 'token',        # required
      title: 'Hello from Grocer', # required
      body: 'Hi',                 # required
      action: 'Read',             # optional; the label of the action button
      url_args: []          # required (array); values that are paired with the placeholders inside the urlFormatString.
                                  # Apple's documention lists url-args as optional, but in testing it was found to be required
    )

    pusher.push(notification)
    feedback = Grocer.feedback(
      certificate: "#{Rails.root}/config/package/cert.pem",      # required
      passphrase:  "",                       # optional
      gateway:     "feedback.push.apple.com", # optional; See note below.
      port:        2196,                     # optional
      retries:     3
    )
    feedback.each do |attempt|
      puts "Device #{attempt.device_token} failed at #{attempt.timestamp}"
    end
  end

  private
  def create_seed_project
    projects.create! do |project|
      project.name = "My Application Name"
      project.token = SecureRandom.hex(16)
    end
  end
end
