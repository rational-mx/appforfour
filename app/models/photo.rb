class Photo < ActiveRecord::Base
  has_one :post, as: :medium
  mount_uploader :image, ImageUploader
  # image:string to be removed
end
