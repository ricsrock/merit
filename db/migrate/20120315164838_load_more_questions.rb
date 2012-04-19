# encoding: utf-8

class LoadMoreQuestions < ActiveRecord::Migration
  def up
    questions = [{:name => 'Conflict', :form_text => 'Deals with customer conflict well'},
                 {:name => 'Concern', :form_text => 'Has genuine concern for customers'},
                 {:name => 'Greets', :form_text => 'Consistently greets customers in a friendly, upbeat tone'},
                 {:name => 'Sincere', :form_text => 'Consistently offers assistance to customers in a sincere tone'},
                 {:name => 'Thanks', :form_text => 'Consistently thanks customers for shopping with us & invites them to return'},
                 {:name => 'Reacts', :form_text => 'Reacts quickly and appropriately to all customer request and needs'},
                 {:name => 'Cell Phone', :form_text => 'Follows company policy in regards to cell phone usage, break schedules'},
                 {:name => 'Register Policies', :form_text => 'Cash Register policies followed: voids, refunds, scanning'},
                 {:name => 'Transaction Speed', :form_text => 'Maintains transaction speed and dollar per hour standards'},
                 {:name => 'Cash Checks Up', :form_text => 'Cash from register checks up accurately'},
                 {:name => 'Stocks Properly', :form_text => 'Stocks inventory properly'},
                 {:name => 'Timely', :form_text => 'Completes assigned task completely and timely'},
                 {:name => 'Clean Standards', :form_text => 'Maintains the store and area of responsibility to our clean, fresh and pricing standards'},
                 {:name => 'Not Scan', :form_text => 'Notifies management of items that do not scan'},
                 {:name => 'Positive Attitude', :form_text => 'Has positive attitude about assigned tasks'},
                 {:name => 'Flexibility', :form_text => 'Flexibility / Willing to learn different areas of job'},
                 {:name => 'Cooperates', :form_text => 'Cooperates well with co-workers'},
                 {:name => 'Direction', :form_text => 'Responds well to direction from superiors'},
                 {:name => 'Checking Procedures', :form_text => 'Follows proper checking procedures'},
                 {:name => 'Till Balances', :form_text => 'Till balances consistently without excessive over/shorts'},
                 {:name => 'Stocks Standard', :form_text => "Stocks at the company standard of 1 1⁄2 pallet per hour"},
                 {:name => 'Finishes Timely', :form_text => 'Finishes assigned tasks in a timely manner'},
                 {:name => 'Work On Time', :form_text => 'Comes to work on time'},
                 {:name => 'Uniform', :form_text => 'Wears the proper uniform with a neat, clean, professional appearance'},
                 {:name => 'Name Tag', :form_text => 'Wears name tag consistently'},
                 {:name => 'Works Schedule', :form_text => 'Works the published work schedule days and times'},
                 {:name => 'Comes In When Needed', :form_text => 'Comes in when needed on days off'},
                 {:name => 'Extra Mile', :form_text => 'Goes the “extra mile” to help our store succeed'}]
    questions.each do |question|
      Question.create(question)
    end
  end

  def down
  end
end
