class BysForResponses < ActiveRecord::Migration
  def up
    add_column :responses, :created_by, :string
    add_column :responses, :updated_by, :string
    add_column :users, :created_by, :string
    add_column :users, :updated_by, :string
  end

  def down
  end
end