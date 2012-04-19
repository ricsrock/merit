class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :appraisal_id
      t.string :section_id
      t.integer :commenter_id
      t.text :note
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
    add_index :comments, :appraisal_id
    add_index :comments, :section_id
    add_index :comments, :commenter_id
  end
end
