class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :last_name
      t.string :first_name
      t.string :login
      #t.string :email # will be added with the Devise migration

      t.timestamps
    end
  end
end
