class User < ActiveRecord::Base
  has_many :projects

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
end
