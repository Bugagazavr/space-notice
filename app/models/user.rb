class User < ActiveRecord::Base
  has_many :projects

  after_create :create_seed_project

  def self.get_by_omniauth(omnihash)
    where(github_id: omnihash["uid"]).first || create! do |user|
      user.github_id = omnihash["uid"]
      user.username  = omnihash["info"]["nickname"]
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
