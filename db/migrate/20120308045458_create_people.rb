class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.date :last_review_date
      t.string :current_rate_of_pay
      t.string :avg_weekly_hours
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
    add_index :people, :first_name
    add_index :people, :last_name
    add_index :people, :last_review_date
  end
end
