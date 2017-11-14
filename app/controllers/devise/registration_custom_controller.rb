class Devise::RegistrationCustomController < DeviseTokenAuth::RegistrationsController

	# Para esta clase todos los indicados por super son lo mismo que realiza la gema desde el core.
	def create
		super
	end

	def destroy
		super
	end

	def update
		super
	end

	# Permite que se ingresen nuevos parámetros custom para el signup de usuarios.
	def sign_up_params
		params.permit(:email, :password, :password_validation, :name, :father_last_name, :mother_last_name, :dependence_id, :user_role_id)
	end

	# Método de sistema utilizado para regresar el usuario al registrarse.
	private
	def render_create_success
		render json: {
			user: resource_data
		}
	end
end
