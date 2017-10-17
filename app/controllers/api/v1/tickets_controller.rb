class Api::V1::TicketsController < ApplicationController
	def index
		@tickets = Ticket.all
		render json: { tickets: @tickets }, status: 200
	end
end
