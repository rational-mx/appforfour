class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :likeable, polymorphic: true
  validates :user_id, uniqueness: {scope: :post_id, message: "Just one like bitch."}
end
