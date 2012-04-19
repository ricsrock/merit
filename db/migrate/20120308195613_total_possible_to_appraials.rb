class TotalPossibleToAppraials < ActiveRecord::Migration
  def up
    add_column :appraisals, :raw_possible, :string
    add_column :appraisals, :raw_percentage, :string
    add_column :appraisals, :raw_5_point, :string
  end

  def down
  end
end
