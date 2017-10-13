class Dependence < ApplicationRecord
  belongs_to :campus_location

  def as_json(options={})
	  super(:include => :campus_location)
	end
end
