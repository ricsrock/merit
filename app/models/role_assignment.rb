class RoleAssignment < ActiveRecord::Base
  validates_presence_of :role_id, :user_id
end
