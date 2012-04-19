class CreateSectionings < ActiveRecord::Migration
  def change
    create_table :sectionings do |t|
      t.integer :section_id
      t.integer :form_id

      t.timestamps
    end
    add_index :sectionings, :section_id
    add_index :sectionings, :form_id
  end
end
