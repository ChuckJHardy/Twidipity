class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :statement, null: false
      t.integer :tuid, null: false, limit: 8

      t.timestamps
    end
  end
end
