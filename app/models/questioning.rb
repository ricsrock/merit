class Questioning < ActiveRecord::Base
  belongs_to :question
  belongs_to :section
  
  validates_presence_of :question_id, :section_id
end
