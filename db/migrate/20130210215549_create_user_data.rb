class CreateUserData < ActiveRecord::Migration
  def up
    create_table(:users) do |t|
      t.string :email,    :null => false
      t.string :password, :null => false
      t.string :salt,     :null => false
    end

    add_index(:users, :email, :unique => true)
  end

  def down
    drop_table(:users)
  end
end
