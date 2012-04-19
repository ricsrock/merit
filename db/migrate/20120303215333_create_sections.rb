class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.text :appraiser_comments
      t.string :created_by
      t.string :updated_by
      t.integer :appraisal_form_id

      t.timestamps
    end
  end
end
