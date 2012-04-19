class CreateRoleAssignments < ActiveRecord::Migration
  def change
    create_table :role_assignments do |t|
      t.integer :role_id
      t.integer :user_id
      t.timestamps
    end
    add_index :role_assignments, :user_id
    add_index :role_assignments, :role_id
  end
end
