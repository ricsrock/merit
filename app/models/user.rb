class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :last_name, :first_name, :login, :person_name, :role_ids, :authorized_store_tokens
  
  validates_uniqueness_of :login
  
  #acts_as_stampable
  
  attr_reader :authorized_store_tokens
  cattr_accessor :the_user
  
  has_one :person
  has_many :appraisals_responsible_for, :through => :person
  has_many :incomplete_appraisals_responsible_for, :through => :person
  has_many :assignments
  has_many :roles, :through => :assignments
  has_many :store_authorizations
  has_many :authorized_stores, :through => :store_authorizations, :source => :store
  has_many :authorized_employees, :through => :authorized_stores, :source => :employees
  has_many :authorized_appraisals, :through => :authorized_employees, :source => :appraisals
  
  accepts_nested_attributes_for :person
  accepts_nested_attributes_for :roles, :allow_destroy => true, :reject_if => proc { |obj| obj.blank? }
  
  
  def self.find_for_database_authentication(warden_conditions)
     conditions = warden_conditions.dup
     login = conditions.delete(:login)
     where(conditions).where(["lower(login) = :value OR lower(email) = :value", { :value => login.strip.downcase }]).first
   end
  
  def person_name
    person.try(:id_and_full_name)
  end
  
  def person_name=(stuff)
    input = stuff.split(' ')
    self.person = Person.where(:id => input[0]).first
  end
  
  def authorized_store_tokens=(ids)
    self.authorized_store_ids = ids.split(",")
  end
  
  def confirmed?
    (!self.confirmed_at.blank? && self.confirmed_at < Time.now) ? true : false
  end
  
  def confirm!
    self.update_attribute(:confirmed_at, Time.now)
  end
  
  def role_names
    self.roles.collect {|r| r.name}
  end
  
  def admin?
    self.role_names.include?('admin') ? true : false
  end
  
  def role_symbols
    @role_symbols ||= roles.map {|r| r.name.underscore.to_sym }
  end
  
  def authorized_for_person?(person_id)
    self.accessible_people.collect {|p| p.id}.include?(person_id)
  end
  
  def authorized_for_appraisal?(appraisal_id)
    self.accessible_appraisals.collect {|a| a.id}.include?(appraisal_id)
  end
  
  
  def accessible_stores
    if self.role_names.include?('admin')
      Store.all(:order => :name)
    else
      self.authorized_stores
    end
  end
  
  # A user is authorized for any person who is currently employed in any of that user's authorized stores.
  def accessible_people
    if self.role_names.include?('admin')
      Person
    elsif self.role_names.include?('executive') or self.role_names.include?('manager')
      self.authorized_employees
    elsif self.role_name.include?('user')
      self.person
    end
  end
  
  # A user is authorized for any appraisal of any person who is currently employed in any of that user's authorized stores.
  def accessible_appraisals
    if self.role_names.include?('admin')
      Appraisal
    elsif self.role_names.include?('executive') or self.role_names.include?('manager')
      self.authorized_appraisals
    elsif self.role_name.include?('user')
      self.person.appraisals_responsible_for
    end
  end
  
  def appraiser_for?(appraisal_id)
    a = Appraisal.find(appraisal_id)
    self.person.id == a.appraiser_id
  end
  
  def reviewer_for?(appraisal_id)
    a = Appraisal.find(appraisal_id)
    self.person.id == a.reviewer_id or self.person.sys_admin?
  end
  
  
  def appraisals_ready_for_review
    Appraisal.where(:percent_complete => "100.0").where(:reviewer_id => self.person.id).where(:approved_at => nil)
  end
  
  def pay_rates_ready_for_approval
    PayRate.joins(:person).where(:status => 'proposed').where("people.id IN (?)", self.accessible_people.all.collect {|p| p.id})
  end
  
  def out_ranks?(person)
    self.person.rank > person.rank ? true : false
  end
end
