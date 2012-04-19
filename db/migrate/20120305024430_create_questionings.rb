class CreateQuestionings < ActiveRecord::Migration
  def change
    create_table :questionings do |t|
      t.integer :question_id
      t.integer :section_id

      t.timestamps
    end
    
    add_index :questionings, :question_id
    add_index :questionings, :section_id
  end
end
