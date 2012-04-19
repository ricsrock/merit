class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :name
      t.text :notes
      t.string :min_pay
      t.string :max_pay
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
