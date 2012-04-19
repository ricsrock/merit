class CreateAppraiserSectionComments < ActiveRecord::Migration
  def change
    create_table :appraiser_section_comments do |t|
      t.integer :appraisal_id
      t.integer :section_id
      t.text :comments
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
    add_index :appraiser_section_comments, :appraisal_id
    add_index :appraiser_section_comments, :section_id
  end
end
