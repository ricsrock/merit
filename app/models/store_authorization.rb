class StoreAuthorization < ActiveRecord::Base
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :store, :class_name => "Store", :foreign_key => "store_id"
  
  validates_presence_of :user_id, :store_id
end
