class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.timestamps
    end
    
    roles = ["admin", "executive", "manager", "user"]
    roles.each do |role|
      Role.create(:name => role)
    end
    
  end
end
