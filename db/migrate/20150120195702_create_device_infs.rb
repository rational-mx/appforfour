class CreateDeviceInfs < ActiveRecord::Migration
  def change
    create_table :device_infs do |t|
      t.string :browser
      t.string :os
      t.belongs_to :post, index: true
      t.belongs_to :comment, index: true

      t.timestamps null: false
    end
    add_foreign_key :device_infs, :posts
    add_foreign_key :device_infs, :comments
  end
end
