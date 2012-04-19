class CreateInitialUser < ActiveRecord::Migration
  def up
    user = User.new(:first_name => 'Joe', :last_name => 'Admin', :password => 'wahoo!', :password_confirmation => 'wahoo!', :login => 'jadmin')
    user.save
    user.update_attribute(:confirmed_at, Time.now)
  end

  def down
  end
end
