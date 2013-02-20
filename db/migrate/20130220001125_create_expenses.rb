class CreateExpenses < ActiveRecord::Migration
  def up
    create_table(:expenses) do |t|
      t.integer :user_id, :null => false
      t.integer :group_id, :null => false
      t.integer :amount_in_cents, :null => false, :default => 0
    end
  end

  def down
    drop_table(:expenses)
  end
end
