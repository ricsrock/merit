class CreateAppraisals < ActiveRecord::Migration
  def change
    create_table :appraisals do |t|
      t.string :name
      t.integer :appraisal_form_id
      t.integer :employee_id
      t.integer :appraiser_id
      t.integer :review_period_id
      t.string :percent_complete
      t.string :raw_score
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
