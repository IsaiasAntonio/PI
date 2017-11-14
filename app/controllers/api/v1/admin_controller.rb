# Es una clase que al igual que devise, usa el modelo de User como base.
class Api::V1::AdminController < ApplicationController
	# Si ActiveRecord regresa un error porque no encontró un registro en específico va a mandar llamar la función de render_record_not_found
	rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
	# Antes de que se ejecute cualquier método se pide que el usuario esté loggeado.
	before_action :authenticate_user!

	# Regresa todos los usuarios si es que el usuario es administrador.
	def index
		if current_user.user_role_id == 1
			@users = User.all
			render json: { users: @users }, status: 200
		else
			render_unauthorized_user
		end
	end

	# Muestra los detalles de cualquier usuario si es que el usuario es administrador.
	def show
		if current_user.user_role_id == 1
			get_user
			render json: { user: @user }, status: 202
		else
			render_unauthorized_user
		end
	end

	# Si es que el usuario es administrador, permite actualizar los datos de cualquier usuario.
	def update
		if current_user.user_role_id == 1
			get_user
			if @user.update(update_user_params)
				render json: { user: @user }, status: 202
			else
				render json: { error: "error" }, status: 422
			end
		else
			render_unauthorized_user
		end
	end

	# Funciones privadas de clase.
	private
	# Regresa los parámetros para hacer el update de un usuario.
	def update_user_params
		params.require(:user).permit(:email, :name, :father_last_name, :mother_last_name, :dependence_id, :user_role_id)
	end

	# Regresa el usuario que usará la clase para cualquier método según su id requerido.
	def get_user
		@user ||= User.find_by(id: params[:id])
	end

	# Regresa el mensaje de error cuando un usuario no es administrador.
	def render_unauthorized_user
		render json: { error: "No está autorizado para accesar." }, status: 401
	end

	# Regresa el mensaje de error cuando un registro no se encuentra.
	def render_record_not_found
		render json: { error: "El ticket no se encontró." }, status: 404
	end
end
