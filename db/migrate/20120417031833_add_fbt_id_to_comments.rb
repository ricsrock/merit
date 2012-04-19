class AddFbtIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :feedback_topic_id, :integer
    add_index :comments, :feedback_topic_id
  end
end