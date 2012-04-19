class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.integer :person_id
      t.integer :position_id
      t.integer :store_id
      t.date :start_date
      t.date :end_date
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
    add_index :employments, :person_id
    add_index :employments, :position_id
    add_index :employments, :store_id
    add_index :employments, :start_date
    add_index :employments, :end_date
  end
end
