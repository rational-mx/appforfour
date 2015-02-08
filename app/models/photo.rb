class Photo < ActiveRecord::Base
  has_one :post, as: :medium
  mount_uploader :image, ImageUploader
end
