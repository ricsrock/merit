class Question < ActiveRecord::Base
  has_many :questionings
  has_many :sections, :through => :questionings
  
  validates_uniqueness_of :form_text
  validates_uniqueness_of :name
  
  acts_as_stampable
  acts_as_audited
end
