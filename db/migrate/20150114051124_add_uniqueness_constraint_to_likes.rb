class AddUniquenessConstraintToLikes < ActiveRecord::Migration
  def change
    add_index :likes, [:user_id, :post_id], name: "one_user_like_per_post", unique: true
  end
end
