class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body
      t.references :user, index: true
      t.belongs_to :medium, polymorphic: true

      t.timestamps null: false
    end
    add_foreign_key :posts, :users
  end
end
