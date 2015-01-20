class CreateDeviseInfs < ActiveRecord::Migration
  def change
    create_table :devise_infs do |t|
      t.string :browser
      t.string :os
      t.belongs_to :post, index: true
      t.belongs_to :comment, index: true

      t.timestamps null: false
    end
    add_foreign_key :devise_infs, :posts
    add_foreign_key :devise_infs, :comments
  end
end
