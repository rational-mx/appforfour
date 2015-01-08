class Article < ActiveRecord::Base
    has_one :post, as: :medium
end
