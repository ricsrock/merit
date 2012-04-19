class CreateReviewPeriods < ActiveRecord::Migration
  def change
    create_table :review_periods do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
    add_index :review_periods, :start_date
  end
end
