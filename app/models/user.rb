class User < ActiveRecord::Base
  has_many :projects
  has_many :devices
  has_many :subscriptions

  before_create :set_token
  after_create :generate_project!

  def self.get_by_omniauth(omnihash)
    where(github_id: omnihash["uid"]).first || create! do |user|
      user.github_id = omnihash["uid"]
      user.username  = omnihash["info"]["nickname"]
    end
  end

  def generate_project!
    projects.create! do |project|
      project.name = "Application #{projects.count + 1}"
      project.token = SecureRandom.hex(16)
    end
  end

  def subscribe(project)
    subscriptions.where(project_id: project.id).first_or_create!
  end

  def unsubscribe(device)
    subscriptions.where(project_id: project.id).destroy_all
  end

  def add_device(token)
    devices.where(token: token).first_or_create!
  end

  def remove_device(token)
    devices.where(token: token).destroy_all
  end

  private
  def set_token
    self.token = SecureRandom.hex(16)
  end
end
