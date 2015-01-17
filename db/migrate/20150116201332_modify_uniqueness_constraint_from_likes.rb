class ModifyUniquenessConstraintFromLikes < ActiveRecord::Migration
  def change
    remove_index :likes, name: "one_user_like_per_post"
    add_index :likes, [:user_id, :likeable_id, :likeable_type], unique: true
  end
end
