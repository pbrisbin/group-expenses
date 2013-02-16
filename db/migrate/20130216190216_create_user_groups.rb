class CreateUserGroups < ActiveRecord::Migration
  def up
    create_table(:groups) do |t|
      t.string :name, :null => false, :default => ''
      t.string :join_token, :null => false
    end

    add_index(:groups, :join_token, :unique => true)

    create_table(:memberships) do |t|
      t.integer :user_id,  :null => false
      t.integer :group_id, :null => false
    end
  end

  def down
    drop_table(:memberships)
    drop_table(:groups)
  end
end
