class Photo < ActiveRecord::Base
    has_one :post, as: :medium
end
