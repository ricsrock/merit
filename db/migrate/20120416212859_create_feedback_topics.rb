class CreateFeedbackTopics < ActiveRecord::Migration
  def change
    create_table :feedback_topics do |t|
      t.string :name
      t.text :form_text
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
