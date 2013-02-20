class CreatePayments < ActiveRecord::Migration
  def up
    create_table(:payments) do |t|
      t.integer :group_id, :null => false
      t.integer :payer_id, :null => false
      t.integer :payee_id, :null => false
      t.integer :amount_in_cents, :null => false, :default => 0

      t.timestamps
    end
  end

  def down
    drop_table(:payments)
  end
end
