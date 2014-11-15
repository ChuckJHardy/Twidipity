class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :uid,      null: false
      t.integer :role,     null: false, default: 0
      t.string  :token,    null: false
      t.string  :secret,   null: false
      t.string  :name
      t.string  :nickname
      t.string  :location
      t.string  :time_zone
      t.string  :lang

      t.timestamps
    end
  end
end
