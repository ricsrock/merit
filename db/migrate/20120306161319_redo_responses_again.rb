class RedoResponsesAgain < ActiveRecord::Migration
  def up
    drop_table :responses
    create_table :responses, :force => true do |t|
      t.integer :appraisal_id
      t.integer :question_id
      t.string :answer
      t.timestamps
    end
    add_index :responses, :appraisal_id
    add_index :responses, :question_id
    add_index :responses, :answer
  end

  def down
  end
end
