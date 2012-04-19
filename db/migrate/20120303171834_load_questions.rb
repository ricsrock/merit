class LoadQuestions < ActiveRecord::Migration
  def up
    questions = [{:name => 'Eye Contact', :form_text => 'Makes eye contact and speaks to all customers'},
                 {:name => 'Shows Product', :form_text => 'Shows customers to products asked for'},
                 {:name => 'Cleanliness', :form_text => 'Maintains high standard of cleanliness in workstation'}]
    questions.each do |question|
      Question.create(question)
    end
  end

  def down
  end
end
