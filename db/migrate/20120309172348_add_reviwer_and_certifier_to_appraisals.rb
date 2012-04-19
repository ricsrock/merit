class AddReviwerAndCertifierToAppraisals < ActiveRecord::Migration
  def change
    add_column :appraisals, :reviewer_id, :integer
    add_column :appraisals, :certifier_id, :integer
    add_index :appraisals, :reviewer_id
    add_index :appraisals, :certifier_id
  end
end