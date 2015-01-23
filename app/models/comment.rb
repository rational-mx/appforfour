class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likeable
  has_one :device_inf
  has_many :notifications, as: :notificable


end
