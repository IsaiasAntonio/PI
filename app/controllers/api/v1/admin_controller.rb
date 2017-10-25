class Api::V1::AdminController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
	before_action :authenticate_user!

	def index
		if current_user.user_role_id == 1
			@users = User.all
			render json: { users: @users }, status: 200
		else
			render_unauthorized_user
		end
	end

	def show
		if current_user.user_role_id == 1
			get_user
			render json: { user: @user }, status: 202
		else
			render_unauthorized_user
		end
	end

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

	private
	def update_user_params
		params.require(:user).permit(:email, :name, :father_last_name, :mother_last_name, :dependence_id, :user_role_id)
	end

	def get_user
		@user ||= User.find_by(id: params[:id])
	end

	def render_unauthorized_user
		render json: { error: "No está autorizado pa hacer esto compa" }, status: 401
	end

	def render_record_not_found
		render json: { error: "El ticket no se encontró." }, status: 404
	end
end
