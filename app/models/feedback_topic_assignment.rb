class FeedbackTopicAssignment < ActiveRecord::Base
  belongs_to :feedback_topic
  belongs_to :appraisal_form
end
