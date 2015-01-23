class AddLikeableRefToLike < ActiveRecord::Migration
  def change
    add_reference :likes, :likeable, index: true, polymorphic: true
    add_foreign_key :likes, :likeable
  end
end
