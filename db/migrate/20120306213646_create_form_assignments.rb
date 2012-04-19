class CreateFormAssignments < ActiveRecord::Migration
  def change
    create_table :form_assignments do |t|
      t.integer :appraisal_form_id
      t.integer :appraisal_id

      t.timestamps
    end
    add_index :form_assignments, :appraisal_form_id
    add_index :form_assignments, :appraisal_id
  end
end
