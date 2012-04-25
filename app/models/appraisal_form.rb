class AppraisalForm < ActiveRecord::Base
  has_many :sectionings, :foreign_key => :form_id
  has_many :sections, :through => :sectionings
  has_many :questions, :through => :sections
  has_many :appraisals
  has_many :feedback_topic_assignments
  has_many :feedback_topics, :through => :feedback_topic_assignments
  
  acts_as_stampable
  acts_as_audited
  
  def available_sections
    Section.all(:conditions => ['sections.id NOT IN
                                  (SELECT sectionings.section_id FROM sectionings
                                  WHERE (sectionings.form_id = ?))', self.id], :order => :name)
  end
  
  def available_feedback_topics
    FeedbackTopic.all(:conditions => ['feedback_topics.id NOT IN
                                  (SELECT feedback_topic_assignments.feedback_topic_id FROM feedback_topic_assignments
                                  WHERE (feedback_topic_assignments.appraisal_form_id = ?))', self.id], :order => :name)
  end
  
  
end
