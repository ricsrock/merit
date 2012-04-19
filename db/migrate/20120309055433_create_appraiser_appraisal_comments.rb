class CreateAppraiserAppraisalComments < ActiveRecord::Migration
  def change
    create_table :appraiser_appraisal_comments do |t|
      t.integer :appraisal_id
      t.text :comments
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
    add_index :appraiser_appraisal_comments, :appraisal_id
  end
end
