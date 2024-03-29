class FeedbackTopic < ActiveRecord::Base
  has_many :feedback_topic_assignments
  validates_presence_of [:name, :form_text]
  validates_uniqueness_of [:name, :form_text]
  
  acts_as_audited
  acts_as_stampable
end
