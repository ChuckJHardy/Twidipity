class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :handle, null: false

      t.timestamps
    end
  end
end
