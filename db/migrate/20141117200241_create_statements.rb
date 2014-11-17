class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.references :user
      t.integer :follow, null: false
      t.integer :for, null: false
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
