class Api::V1::TicketMovementsController < ApplicationController
	def index
		@ticket_movements = TicketMovement.all
		render json: { ticket_movements: @ticket_movements }, status: 200
	end
end
