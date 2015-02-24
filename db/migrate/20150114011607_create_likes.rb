class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :likeable, polymorphic: true

      t.timestamps null: false
    end
    add_foreign_key :likes, :users
  end
end
