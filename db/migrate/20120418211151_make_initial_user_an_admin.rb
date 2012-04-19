class MakeInitialUserAnAdmin < ActiveRecord::Migration
  def up
    user = User.find_by_login('jadmin')
    role = Role.find_by_name('admin')
    user.roles << role
  end

  def down
  end
end
