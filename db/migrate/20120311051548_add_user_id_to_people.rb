class AddUserIdToPeople < ActiveRecord::Migration
  def change
    remove_column :users, :person_id
    add_column :people, :user_id, :integer
    add_index :people, :user_id
  end
end