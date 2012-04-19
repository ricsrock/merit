class CreatePayRates < ActiveRecord::Migration
  def change
    create_table :pay_rates do |t|
      t.decimal :rate, :precision => 8, :scale => 2
      t.string :cadence
      t.string :status
      t.datetime :approved_at
      t.string :approved_by
      t.string :created_by
      t.string :updated_by
      t.integer :person_id
      t.timestamps
    end
    add_index :pay_rates, :person_id
    add_index :pay_rates, :status
  end
end