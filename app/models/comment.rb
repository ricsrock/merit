class Comment < ActiveRecord::Base
  belongs_to :appraisal
  belongs_to :section
  belongs_to :feedback_topic
  
  validates_presence_of :appraisal_id, :comment_type
  
  acts_as_stampable
  acts_as_audited
  
  scope :for_appraisal, lambda {|appraisal_id| where(:appraisal_id => appraisal_id).where(:comment_type => 'Appraisal')}
  scope :for_appraisal_either_type, lambda {|appraisal_id| where(:appraisal_id => appraisal_id)}
  scope :for_section, lambda {|section_id| where(:section_id => section_id)}
  scope :for_feedback_topic, lambda {|fbt_id| where(:feedback_topic_id => fbt_id)}
  
  def reference
    if self.section
      result = "Section: " + self.section.name.to_s
    elsif self.feedback_topic
      result = "Feedback Topic: " + self.feedback_topic.name.to_s
    else
      result = "Appraisal: " + self.appraisal.name.to_s
    end
    result
  end
  
end
