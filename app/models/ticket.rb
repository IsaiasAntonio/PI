class Ticket < ApplicationRecord
  belongs_to :ticket_state
  belongs_to :user
  belongs_to :responsable, :class_name => "User"



	def as_json(options={})
	  super(:include => [:user, :responsable])
	end
end
