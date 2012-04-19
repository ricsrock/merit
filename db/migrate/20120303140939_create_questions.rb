class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.text :form_text
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end
end
