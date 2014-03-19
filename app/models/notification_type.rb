class NotificationType < ActiveRecord::Base
  belongs_to :project

  validates :name, :project, presence: true

  before_create :set_token

  private
  def set_token
    self.token = SecureRandom.hex(16)
  end
end
