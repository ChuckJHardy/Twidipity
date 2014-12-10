class CreateStatementsSuggestions < ActiveRecord::Migration
  def change
    create_table :statements_suggestions do |t|
      t.references :statement
      t.references :suggestion

      t.timestamps
    end
  end
end
