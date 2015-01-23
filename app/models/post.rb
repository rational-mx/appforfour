class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :medium, polymorphic: true
  has_many :comments
  has_many :likes, as: :likeable
  has_one :device_inf
  has_many :notifications, as: :notificable
  def comment_for_show_in_post( number_of_comments)
    self.comments.order('id desc').all[number_of_comments-4..number_of_comments].reverse
  end


end
