class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :likeable, polymorphic: true
  has_many :notifications, as: :notificable

  validates :user_id, uniqueness: {scope: [:likeable_id, :likeable_type], message: "Just one like bitch."}
end
