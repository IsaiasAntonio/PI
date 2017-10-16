class Devise::RegistrationCustomController < DeviseTokenAuth::RegistrationsController
	def create
		super
	end

	def sign_up_params
		params.permit(:email, :password, :password_validation, :name, :father_last_name, :mother_last_name, :dependence_id, :user_role_id)
	end
end
