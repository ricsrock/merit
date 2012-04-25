class Store < ActiveRecord::Base
  has_many :employments, :dependent => :destroy
  has_many :current_employments, :class_name => 'Employment', :conditions => ["employments.end_date IS NULL OR employments.end_date > '#{Date.today.to_s}'"]
  has_many :employees, :through => :current_employments, :source => :person
  has_many :store_authorizations
  has_many :authorized_users, :through => :store_authorizations, :source => :user
  
  acts_as_stampable
  acts_as_audited
  
# def current_employments
#   Employment.joins(:store).where('employments.end_date' < Date.today.to_s).where(['stores.id = ?', self.id])
# end
  
  def current_manager
    Employment.joins(:store, :position).where("employments.end_date <= ? OR employments.end_date IS NULL", Date.today.to_s).where(['stores.id = ?', self.id]).where('positions.name LIKE ?', 'Manager').first
  end
  
  def current_employees
    Person.select('DISTINCT people.*').where('employments.store_id = ?',self.id).where("employments.end_date > ? OR employments.end_date IS NULL", Date.today.to_s).joins(:employments)
  end
  
  def supervisor
    Person.where(:roles => {:name => 'executive'}).where(:store_authorizations => {:store_id => self.id}).joins({:user => :roles}).joins({:user => :store_authorizations}).first
  end
end
