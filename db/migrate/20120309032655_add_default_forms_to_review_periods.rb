class AddDefaultFormsToReviewPeriods < ActiveRecord::Migration
  def change
    add_column :review_periods, :default_non_exempt_form_id, :integer
    add_column :review_periods, :default_exempt_form_id, :integer
    add_index :review_periods, :default_non_exempt_form_id
    add_index :review_periods, :default_exempt_form_id
  end
end
