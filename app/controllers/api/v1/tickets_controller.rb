class Api::V1::TicketsController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
	before_action :authenticate_user!

	def index
		@tickets = Ticket.all
		render json: { tickets: @tickets }, status: 200
	end

	def show
		get_ticket
		render json: { ticket: @ticket }, status: 200
	end

	def create
		@ticket = Ticket.new(create_ticket_params)
		if @ticket.save
			render json: { ticket: @ticket }, status: 201
		else
			render json: { error: "El ticket no se ha podido generar" }, status:422
		end
	end

	def edit
		get_ticket
		render json: { ticket: @ticket }, status: 200
	end

	def update
		get_ticket
		if @ticket.update(update_ticket_params)
			render json: { ticket: @ticket }, status: 202
		else
			render json: { error: "El ticket no pudo ser actualizado" }, status: 422
		end
	end

	def destroy
		get_ticket
		if @ticket.destroy
			render json: { status: "Borrado" }, status: 202
		else
			render json: { error: "No se pudo borrar el ticket" }, status: 422
		end
	end

	private
	def create_ticket_params
		params.require(:ticket).permit(:description, :user_id, :ticket_state_id, :responsable_id)
	end

	def update_ticket_params
		params.require(:ticket).permit(:description, :ticket_state_id, :user_id, :end_date, :responsable_id)
	end

	def get_ticket
		@ticket ||= Ticket.find(params[:id])
	end

	def render_record_not_found
		render json: { error: "El ticket no se encontró." }, status: 404
	end
end
