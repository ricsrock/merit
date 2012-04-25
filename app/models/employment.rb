class Employment < ActiveRecord::Base
  belongs_to :person
  belongs_to :position
  belongs_to :store
  belongs_to :coworker, :class_name => "Person"
  validates_presence_of :person_id, :position_id, :store_id, :start_date
  validates_uniqueness_of :position_id, :scope => [:store_id, :person_id] # a person can only be assigned to a given position once at a given store
  
  attr_accessor :resource_type
  attr_accessor :person_name
  
  acts_as_stampable
  acts_as_audited
  
  scope :for_store, lambda {|store_id| where(:store_id => store_id)}
  scope :current, where('end_date > ? OR end_date IS NULL', Date.today.to_s)
  scope :for_position, lambda {|position_id| where(:position_id => position_id)}
  
  def current?
    self.end_date.nil? or self.end_date > Date.today ? true : false
  end
  
  def  position_and_store
    position.name + ' (' + store.name + ')'
  end
  
  def person_name
    person.try(:id_and_full_name)
  end
    
  def person_name=(stuff)
    input = stuff.split(' ')
    self.person = Person.where(:id => input[0]).first
  end
  
end
