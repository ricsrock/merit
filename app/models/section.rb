class Section < ActiveRecord::Base
  has_many :questionings, :dependent => :destroy
  has_many :questions, :through => :questionings
  has_many :sectionings, :dependent => :destroy
  
  acts_as_stampable
  acts_as_audited
  
  def available_questions
    Question.all(:conditions => ['questions.id NOT IN
                                  (SELECT questionings.question_id FROM questionings
                                  WHERE (questionings.section_id = ?))', self.id], :order => :form_text)
  end
end
