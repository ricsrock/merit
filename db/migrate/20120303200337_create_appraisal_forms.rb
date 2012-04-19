class CreateAppraisalForms < ActiveRecord::Migration
  def change
    create_table :appraisal_forms do |t|
      t.string :name
      t.text :comments
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end
end
