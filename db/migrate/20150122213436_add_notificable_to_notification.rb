class AddNotificableToNotification < ActiveRecord::Migration
  def change
    add_reference :notifications, :notificable, index: true, polymorphic: true
    add_foreign_key :notifications, :notificable
  end
end
