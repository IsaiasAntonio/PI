class Api::V1::UserRolesController < ApplicationController
	def index
		@user_roles = UserRole.all
		render json: { user_roles: @user_roles }, status: 200
	end
end
