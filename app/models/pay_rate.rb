class PayRate < ActiveRecord::Base
  CADENCES = ["hour", "week", "year"]
  belongs_to :person, :class_name => "Person", :foreign_key => "person_id"
  validates_presence_of :rate, :cadence
  
  acts_as_stampable
  acts_as_audited
  
  def approve!(user)
    self.update_attributes(:approved_at => Time.now, :approved_by => user.login, :status => "approved")
  end
end
