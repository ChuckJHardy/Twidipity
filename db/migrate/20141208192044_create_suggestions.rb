class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.integer :tuid, null: false, limit: 8
      t.string :slug
      t.string :name
      t.text   :description
      t.string :screen_name
      t.string :profile_image_uri
      t.string :uri

      t.timestamps
    end
  end
end
