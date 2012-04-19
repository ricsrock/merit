class Sectioning < ActiveRecord::Base
  belongs_to :section
  belongs_to :form
  
  validates_presence_of :section_id, :form_id
end
