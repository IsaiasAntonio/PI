class Api::V1::TicketStatesController < ApplicationController
	def index
		@ticket_states = TicketState.all
		render json: { ticket_states: @ticket_states }, status: 200
	end
end
