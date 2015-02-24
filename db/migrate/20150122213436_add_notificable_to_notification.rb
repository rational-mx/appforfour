class AddNotificableToNotification < ActiveRecord::Migration
  def change
    add_reference :notifications, :notificable, index: true, polymorphic: true
  end
end
