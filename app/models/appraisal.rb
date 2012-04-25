class Appraisal < ActiveRecord::Base
  belongs_to :appraisal_form
  has_many :responses, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :appraisal_comments, :class_name => "Comment", :foreign_key => :appraisal_id, :conditions => {:comment_type => 'Appraisal'}
  has_many :section_comments, :class_name => "Comment", :foreign_key => :appraisal_id, :conditions => {:comment_type => 'Section'}
  
  belongs_to :employee, :class_name => 'Person', :foreign_key => :employee_id
  belongs_to :appraiser, :class_name => 'Person', :foreign_key => :appraiser_id
  belongs_to :reviewer, :class_name => 'Person', :foreign_key => :reviewer_id
  belongs_to :certifier, :class_name => 'Person', :foreign_key => :certifier_id
  belongs_to :review_period
  
  validates_presence_of :appraisal_form_id, :employee_id, :appraiser_id, :reviewer_id, :review_period_id
  validates_uniqueness_of :employee_id, :scope => :review_period_id, :message => "This employee already has an appraisal for this review period."
  
  validate :lock_down_attributes_when_started
  
  accepts_nested_attributes_for :responses
  accepts_nested_attributes_for :comments
  
  before_update :set_raw_score
  before_update :set_raw_possible
  after_create  :set_name
  
  acts_as_stampable
  acts_as_audited
  
 #ransacker :for_person, 
 #          :formatter => proc {|term| joins(:employee).where(:people => {:last_name_cont => term, :first_name_cont => term})} do |parent|
 #  parent.table[:last_name]
 #end
     
  def create_responses
    self.appraisal_form.questions.each do |question|
      Response.new(:question_id => question.id, :appraisal_id => self.id).save
    end
  end
  
  def response_for_this_question(question_id)
    Response.find_by_appraisal_id_and_question_id(self.id, question_id)
  end
  
  def comment_for_this_section(section_id)
    Comment.find_or_create_by_appraisal_id_and_section_id_and_comment_type(self.id, section_id, 'Section')
  end
  
  def comment_for_this_feedback_topic(feedback_topic_id)
    Comment.find_or_create_by_appraisal_id_and_feedback_topic_id_and_comment_type(self.id, feedback_topic_id, 'FeedbackTopic')
  end

  def comment_for_this_appraisal
    Comment.find_or_create_by_appraisal_id_and_comment_type(self.id, 'Appraisal')
  end
  
  def completed_responses
    Response.where('appraisals.id = ? AND responses.answer IS NOT NULL', self.id).includes(:appraisal)
  end
  
  def percent_completed
    (self.completed_responses.length.to_f / self.responses.length.to_f).to_f * 100
  end
  
  def answered_responses
    self.responses.where('answer != ?', 'omit').where('answer IS NOT NULL')
  end
  
  def responded_responses
    self.responses.where('answer IS NOT NULL')
  end
  
  def valid_responses
    self.responses.where('answer != ?', 'omit')
  end
  
  def possible_responses
    self.responses.where('answer != ? OR answer IS NULL', 'omit')
  end
  
  def set_raw_score
    valid_responses = self.responses.where('answer != ?', 'omit').where('answer IS NOT NULL')
    self.raw_score = valid_responses.collect {|r| r.answer.to_i}.sum
  end
  
  def set_raw_possible
    valid_responses = self.responses.where('answer != ?', 'omit')
    self.raw_possible = valid_responses.length * 5
  end
  
  def set_raw_percentage
    a = (self.answered_responses.collect {|r| r.answer.to_i}.sum.to_f / (self.valid_responses.length * 5).to_f).to_f * 100
    self.update_attribute(:raw_percentage, (a.finite? ? a : 0.0))
  end
  
  def set_5_point_score
    self.update_attribute(:raw_5_point, (self.raw_percentage.to_f/20.to_f).to_f)
  end
  
  def set_name
    self.update_attribute(:name, "#{self.employee.last_name}/#{self.appraiser.last_name}/#{self.review_period.name}")
  end
  
  def set_percent_complete
    self.update_attribute(:percent_complete, ((self.responded_responses.length.to_f / self.responses.length.to_f).to_f * 100))
  end
  
  def started?
    self.responded_responses.length > 0 ? true : false
  end
  
  def completed?
    self.percent_completed == 100.00 ? true : false
  end
  
  def approve!(login)
    self.update_attributes(:approved_at => Time.now, :approved_by => login)
  end
  
  def unapprove!
    self.update_attributes(:approved_at => nil, :approved_by => nil)
  end
  
  def approved?
    self.approved_at.blank? ? false : true
  end
  
  def self.accessible_to_user(user)
    if user.role_names.include?('admin')
      Appraisal
    elsif user.role_names.include?('executive') or user.role_names.include?('manager')
      Appraisal.joins(:employee => {:employments => {:store => :store_authorizations}}).where(:store_authorizations => {:user_id => user.id}).where("employments.end_date IS NULL OR employments.end_date > ?", Date.today)
    elsif user.role_name.include?('user')
      Appraisal.where(:appraiser_id => user.id)
    end
  end
  
  
  private

    def lock_down_attributes_when_started
      return unless started?

      message = "cannot be changed after appraisal has been started."
      errors.add(:appraisal_form_id, message) if appraisal_form_id_changed?
      errors.add(:employee_id, message) if employee_id_changed?
      errors.add(:appraiser_id, message) if appraiser_id_changed?
      errors.add(:review_period_id, message) if review_period_id_changed?
      errors.add(:name, message) if name_changed?
    end
end
