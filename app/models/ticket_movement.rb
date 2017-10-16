class TicketMovement < ApplicationRecord
  belongs_to :movement_tag
  belongs_to :ticket
end
