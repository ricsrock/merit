class Position < ActiveRecord::Base
  CADENCES = [
              {:name => "Hourly", :unit => "Hour"}, 
              {:name => "Weekly", :unit => "Week"},
              {:name => "Annually", :unit => "Year"}
              ]
  
  has_many :employments, :dependent => :destroy
  
  acts_as_stampable
  acts_as_audited
  
  def self.pay_unit_for(pay_cadence_name)
    Position::CADENCES.select {|w| w[:name] == "#{pay_cadence_name}"}.first[:unit]
  end
  
  def annual_min_pay
    self.min_pay.to_f * 2080
  end
  
  def annual_max_pay
    self.max_pay.to_f * 2080
  end
  
end
