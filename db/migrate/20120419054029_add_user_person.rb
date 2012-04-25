class AddUserPerson < ActiveRecord::Migration
  def up
    person = Person.new(:last_name => 'Admin', :first_name => 'Joe', :employee_number => '777777')
    person.save
    
    user = User.find_by_login('jadmin')
    user.person = person
    user.save
  end

  def down
  end
end
