class Api::V1::TicketMovementsController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
	before_action :authenticate_user!, :except => [:index, :show]

	def index
		@ticket_movements = TicketMovement.where(ticket_id: params[:ticket_id])
		render json: { ticket_movements: @ticket_movements }, status: 200
	end

	def show
		get_ticket_movement
		render json: { ticket_movement: @ticket_movement }, status: 200
	end

	def create
		@ticket_movement = TicketMovement.new(create_ticket_movement_params)
		if @ticket_movement.save
			render json: { ticket_movement: @ticket_movement }, status: 201
		else
			render json: { error: "El movimiento no se ha podido generar" }, status:422
		end
	end

	def edit
		get_ticket_movement
		render json: { ticket_movement: @ticket_movement }, status: 200
	end

	def update
		get_ticket_movement
		if @ticket_movement.update(update_ticket_params)
			render json: { ticket_movement: @ticket_movement }, status: 202
		else
			render json: { error: "El ticket no pudo ser actualizado" }, status: 422
		end
	end

	def destroy
		get_ticket_movement
		if @ticket_movement.destroy
			render json: { status: "Borrado" }, status: 202
		else
			render json: { error: "No se pudo borrar el movimiento" }, status: 422
		end
	end

	private
	def create_ticket_movement_params
		params.require(:ticket_movement).permit(:description, :movement_tag_id, :ticket_id)
	end

	def update_ticket_params
		params.require(:ticket_movement).permit(:description, :movement_tag_id)
	end

	def get_ticket_movement
		@ticket_movement ||= TicketMovement.find(params[:id])
	end

	def render_record_not_found
		render json: { error: "El movimiento no se encontró." }, status: 404
	end
end
