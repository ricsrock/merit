class CreateFeedbackTopicAssignments < ActiveRecord::Migration
  def change
    create_table :feedback_topic_assignments do |t|
      t.integer :appraisal_form_id
      t.integer :feedback_topic_id
      t.timestamps
    end
    add_index :feedback_topic_assignments, :appraisal_form_id
    add_index :feedback_topic_assignments, :feedback_topic_id
  end
end