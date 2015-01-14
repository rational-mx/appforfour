class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :medium, polymorphic: true
  has_many :comments
end
