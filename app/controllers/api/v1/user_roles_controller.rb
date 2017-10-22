class Api::V1::UserRolesController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found

	def index
		@user_roles = UserRole.all
		render json: { user_roles: @user_roles }, status: 200
	end

	def show
		get_user_role
		render json: { user_role: @user_role }, status: 200
	end

	def create
		@user_role = UserRole.new(user_role_params)
		if @user_role.save
			render json: { user_role: @user_role }, status: 200
		else
			render json: { error: "El rol de usuario no se ha podido generar" }, status:422
		end
	end

	def edit
		get_user_role
		render json: { user_role: @user_role }, status: 200
	end

	def update
		get_user_role
		if @user_role.update(user_role_params)
			render json: { user_role: @user_role }, status: 200
		else
			render json: { error: "El rol de usuario no pudo ser actualizado" }, status: 422
		end
	end

	def destroy
		get_user_role
		if @user_role.destroy
			render json: { status: "Borrado" }, status: 200
		else
			render json: { error: "No se pudo borrar el rol de usuario" }, status: 422
		end
	end

	private
	def user_role_params
		params.require(:user_role).permit(:name)
	end

	def get_user_role
		@user_role ||= UserRole.find(params[:id])
	end

	def render_record_not_found
		render json: { error: "El rol de usuario no se encontró." }, status: 404
	end
end
