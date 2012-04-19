class AddExemptToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :exempt, :boolean
  end
end
