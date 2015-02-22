class User < ActiveRecord::Base
  has_many :projects
  has_many :devices
  has_many :subscriptions

  before_create :set_token
  after_create :generate_project!

  def self.get_by_omniauth(provider, omnihash)
    where(provider_user_id: omnihash["uid"], provider: provider).first || create! do |user|
      user.provider_user_id = omnihash["uid"]
      user.provider = provider
      user.username  = omnihash["info"]["nickname"]
    end
  end

  def generate_project!
    project = projects.create! do |project|
      project.name = "Application #{projects.count + 1}"
      project.token = SecureRandom.hex(16)
    end
    project.subscriptions.create! user_id: id
    project
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
