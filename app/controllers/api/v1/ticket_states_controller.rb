class Api::V1::TicketStatesController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
	before_action :authenticate_user!, :except => [:index, :show]

	def index
		@ticket_states = TicketState.all
		render json: { ticket_states: @ticket_states }, status: 200
	end

	def show
		get_ticket_state
		render json: { ticket_state: @ticket_state }, status: 200
	end

	def create
		@ticket_state = TicketState.new(ticket_state_params)
		if @ticket_state.save
			render json: { ticket_state: @ticket_state }, status: 201
		else
			render json: { error: "El estado del ticket no se ha podido generar" }, status:422
		end
	end

	def edit
		get_ticket_state
		render json: { ticket_state: @ticket_state }, status: 200
	end

	def update
		get_ticket_state
		if @ticket_state.update(ticket_state_params)
			render json: { ticket_state: @ticket_state }, status: 202
		else
			render json: { error: "El estado del ticket no pudo ser actualizado" }, status: 422
		end
	end

	def destroy
		get_ticket_state
		if @ticket_state.destroy
			render json: { status: "Borrado" }, status: 202
		else
			render json: { error: "No se pudo borrar el estado del ticket" }, status: 422
		end
	end

	private
	def ticket_state_params
		params.require(:ticket_state).permit(:name)
	end

	def get_ticket_state
		@ticket_state ||= TicketState.find(params[:id])
	end

	def render_record_not_found
		render json: { error: "El estado del ticket no se encontró." }, status: 404
	end
end
