class Response < ActiveRecord::Base
  belongs_to :appraisal
  belongs_to :question
  validates_presence_of :appraisal_id, :question_id
  validates_uniqueness_of :question_id, :scope => :appraisal_id
  
  attr_accessible :answer, :question_id, :appraisal_id
  
  after_update {|record|
                record.appraisal.set_raw_percentage
                record.appraisal.set_5_point_score
                record.appraisal.set_percent_complete}
                
  acts_as_stampable
  
end
