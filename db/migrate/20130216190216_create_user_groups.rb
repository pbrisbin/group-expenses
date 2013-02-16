class CreateUserGroups < ActiveRecord::Migration
  def up
    create_table(:groups) do |t|
      t.string :name, :default => ''
    end

    create_table(:groups_users) do |t|
      t.integer :group_id, :null => false
      t.integer :user_id,  :null => false
    end
  end

  def down
    drop_table(:groups_users)
    drop_table(:groups)
  end
end
