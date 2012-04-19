class AddPayCadence < ActiveRecord::Migration
  def up
    add_column :positions, :pay_cadence, :string
    add_index :positions, :pay_cadence
  end

  def down
  end
end