class UpdatedByForStores < ActiveRecord::Migration
  def up
    add_column :stores, :updated_by, :string
    add_column :stores, :created_by, :string
  end

  def down
  end
end