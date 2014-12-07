class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :statement, null: false
      t.integer :tuid, null: false, limit: 8
      t.string :name
      t.string :screen_name
      t.string :profile_image_uri
      t.string :uri

      t.timestamps
    end
  end
end
