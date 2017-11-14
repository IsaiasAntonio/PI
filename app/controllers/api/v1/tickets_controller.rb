class Api::V1::TicketsController < ApplicationController
	# Si ActiveRecord regresa un error porque no encontró un registro en específico va a mandar llamar la función de render_record_not_found
	rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
	# Antes de que se ejecute cualquier método se pide que el usuario esté loggeado.
	before_action :authenticate_user!

	# Regresa todos los tickets del usuario
	def index
		@tickets = Ticket.all
		render json: { tickets: @tickets }, status: 200
	end

	# Muestra los detalles de un ticket en específico usando su id.
	def show
		get_ticket
		render json: { ticket: @ticket }, status: 200
	end

	# Genera un ticket nuevo usando los siguientes parámetros:
	# description,
	# user_id,
	# ticket_state_id y
	# responsable_id
	def create
		@ticket = Ticket.new(create_ticket_params)
		if @ticket.save
			render json: { ticket: @ticket }, status: 201
		else
			render json: { error: "El ticket no se ha podido generar" }, status:422
		end
	end

	# Regresa los detalles de un ticket que será modificado usando su id.
	def edit
		get_ticket
		render json: { ticket: @ticket }, status: 200
	end

	# Se editan los datos de un ticket con los siguientes parámetros:
	# description,
	# user_id,
	# ticket_state_id y
	# responsable_id
	# end_date
	def update
		get_ticket
		if @ticket.update(update_ticket_params)
			render json: { ticket: @ticket }, status: 202
		else
			render json: { error: "El ticket no pudo ser actualizado" }, status: 422
		end
	end

	# Elimina un ticket utilizando su id.
	def destroy
		get_ticket
		if @ticket.destroy
			render json: { status: "Borrado" }, status: 202
		else
			render json: { error: "No se pudo borrar el ticket" }, status: 422
		end
	end

	# La declaración de private indica que los métodos sólo serán accesibles internamente en la clase.
	private
	# Regresa los valores de los parámetros requeridos para crear un ticket.
	def create_ticket_params
		params.require(:ticket).permit(:description, :user_id, :ticket_state_id, :responsable_id)
	end

	# Regresa los valores requeridos para actualizar un ticket.
	def update_ticket_params
		params.require(:ticket).permit(:description, :ticket_state_id, :user_id, :end_date, :responsable_id)
	end

	# Regresa el ticket que se está usando con el actual parámetro del id.
	def get_ticket
		@ticket ||= Ticket.find(params[:id])
	end

	# Regresa la respuesta de error cuando un ticket no se encuentra en los registros de la base de datos.
	def render_record_not_found
		render json: { error: "El ticket no se encontró." }, status: 404
	end
end
