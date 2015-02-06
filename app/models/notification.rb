class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :notificable , polymorphic: true

  def add_user_and_notificable(user,source)
    self.user = user
    self.notificable = source
    self.save!
  end

  def self.session_notifications(owner)
    where(user: owner)
  end
end
