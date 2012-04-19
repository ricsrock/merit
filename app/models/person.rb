class Person < ActiveRecord::Base
  belongs_to :user
  
  has_many :employments
  has_many :current_employments, :class_name => 'Employment', :conditions => ['employments.end_date IS NULL OR employments.end_date > ?', Date.today.to_s]
  has_many :stores_employed, :through => :current_employments, :source => :store
  has_many :positions, :through => :employments
  has_many :current_positions, :through => :current_employments, :source => :position
  has_many :appraisals, :class_name => 'Appraisal', :foreign_key => :employee_id
  has_many :appraisals_responsible_for, :class_name => 'Appraisal', :foreign_key => :appraiser_id
  has_many :incomplete_appraisals_responsible_for, :class_name => 'Appraisal', :foreign_key => :appraiser_id, :conditions => ['percent_complete != ? OR percent_complete IS NULL', '100.0']
  has_many :comments, :through => :appraisals
  has_many :coworkers, :through => :stores_employed, :source => :employees
  has_many :pay_rates
  
  #after_initialize :create_initial_pay_rate
  
  acts_as_stampable
  
  validates_presence_of [:first_name, :last_name, :employee_number]
  validates_uniqueness_of :employee_number
  
  accepts_nested_attributes_for :pay_rates
  
  scope :managers, where(:positions => {:name => 'Manager'}).joins(:positions).select('DISTINCT people.*').order(:last_name)
  scope :supervisors, where(:roles => {:name => 'executive'}).joins({:user => :roles})
  
  def name
    self.first_name + ' ' + self.last_name
  end
  
  def full_name
    self.name
  end
  
  def id_and_full_name
    self.id.to_s + ' ' + self.full_name
  end
  
  def exempt?
    self.current_positions.collect {|p| p.exempt}.include?(true) ? true : false
  end
  
  # these methods for a cascading structure for permissions: admins will return true for any persmission admin or below... an admin is also an executive, manager & user
  # executives will return true for any permission executive or below... an executive is also a manager & user
  # and so on...
  def sys_admin?
    self.user && self.user.role_names.include?('admin') ? true : false
  end
  
  def sys_executive?
    self.sys_admin? or (self.user && self.user.role_names.include?('executive')) ? true : false
  end
  
  def sys_manager?
    self.sys_executive? or (self.user && self.user.role_names.include?('manager')) ? true : false
  end
  
  def sys_user?
    self.sys_manager? or (self.user && self.user.role_names.include?('user')) ? true : false
  end
  
  def rank
    self.current_employments.collect {|s| s.position.rank.to_i}.max || 0
  end
  
  def create_initial_pay_rate
    self.pay_rates.build(:status => 'proposed')
  end
  
  def self.accessible_to_user(user)
    if user.role_names.include?('admin')
      Person
    elsif user.role_names.include?('executive') or user.role_names.include?('manager')
      Person.joins(:employments => {:store => :store_authorizations}).where(:store_authorizations => {:user_id => user.id}).where("employments.end_date IS NULL OR employments.end_date > ?", Date.today)
    elsif user.role_name.include?('user')
      user.person
    end
  end
  
end
