class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :answer
      t.integer :questioning_id
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
    add_index :responses, :questioning_id
  end
end
