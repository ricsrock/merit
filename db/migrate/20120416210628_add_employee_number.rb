class AddEmployeeNumber < ActiveRecord::Migration
  def up
    add_column :people, :employee_number, :string
    add_index :people, :employee_number
  end

  def down
  end
end