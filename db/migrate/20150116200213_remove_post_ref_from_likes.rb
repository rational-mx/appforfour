class RemovePostRefFromLikes < ActiveRecord::Migration
  def change
    remove_reference :likes, :post, index: true
    remove_foreign_key :likes, :posts
  end
end
