class Dependence < ApplicationRecord
  belongs_to :campus_location
  validates :name, presence: true, uniqueness: true
  validates :campus_location_id, presence: true

	def as_json(options={})
	  super(:include => :campus_location)
	end
end
