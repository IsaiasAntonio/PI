class Ticket < ApplicationRecord
  belongs_to :ticket_state
  belongs_to :user
end
