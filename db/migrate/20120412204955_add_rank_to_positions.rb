class AddRankToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :rank, :integer
    add_index :positions, :rank
  end
end