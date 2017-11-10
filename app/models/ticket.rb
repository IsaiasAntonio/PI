class Ticket < ApplicationRecord
  belongs_to :ticket_state
  belongs_to :user

	def as_json(options={})
	  super(:include => :user)
	end
end
