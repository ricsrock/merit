class ReviewPeriod < ActiveRecord::Base
  belongs_to :default_non_exempt_form, :class_name => 'AppraisalForm', :foreign_key => :default_non_exempt_form_id
  belongs_to :default_exempt_form, :class_name => 'AppraisalForm', :foreign_key => :default_exempt_form_id
  
  has_many :appraisals
  has_many :completed_appraisals, :class_name => "Appraisal", :foreign_key => :review_period_id, :conditions => {:percent_complete => "100.0"}
  
  validates_presence_of :default_non_exempt_form_id, :default_exempt_form_id
  
  acts_as_stampable
  
  def batch_create_appraisals
    Store.all.each do |store|
      if store.current_manager
        manager = store.current_manager.person
        sup_id = store.supervisor ? store.supervisor.id : nil
        store.current_employees.each do |employee|
          form_id = employee.exempt? ? self.default_exempt_form_id : self.default_non_exempt_form_id
          a = Appraisal.new(:appraisal_form_id => form_id,
                        :review_period_id => self.id,
                        :employee_id => employee.id,
                        :appraiser_id => manager.id,
                        :reviewer_id => sup_id,
                        :reviewer_id => sup_id)
          a.save
        end
      end
    end
  end

# class end 
end
