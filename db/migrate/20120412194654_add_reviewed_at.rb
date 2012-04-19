class AddReviewedAt < ActiveRecord::Migration
  def up
    add_column :appraisals, :approved_at, :datetime
    add_column :appraisals, :approved_by, :string
    add_column :appraisals, :certified_at, :datetime
    add_column :appraisals, :certified_by, :string
    
    add_index :appraisals, :approved_by
    add_index :appraisals, :approved_at
    add_index :appraisals, :certified_at
    add_index :appraisals, :certified_by
    add_index :appraisals, :employee_id
    add_index :appraisals, :appraiser_id
    add_index :appraisals, :review_period_id
  end

  def down
  end
end