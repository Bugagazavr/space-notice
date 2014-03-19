class User < ActiveRecord::Base
  has_many :projects

  after_create :create_seed_project

  def self.get_by_omniauth(omnihash)
    where(github_id: omnihash["uid"]).first || create! do |user|
      user.github_id = omnihash["uid"]
      user.username  = omnihash["nickname"]
    end
  end

  private
  def create_seed_project
    project = projects.create! do |project|
      project.name = "My Application Name"
    end
    project.notification_types.create! do |notification_type|
      notification_type.name = "My service name"
    end
  end
end
