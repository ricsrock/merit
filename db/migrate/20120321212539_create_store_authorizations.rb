class CreateStoreAuthorizations < ActiveRecord::Migration
  def change
    create_table :store_authorizations do |t|
      t.integer :user_id
      t.integer :store_id

      t.timestamps
    end
    add_index :store_authorizations, :user_id
    add_index :store_authorizations, :store_id
  end
end