class Api::V1::ResponsablesController < ApplicationController

	def index
		@responsables = User.where("user_role_id < 3")
		render json: { responsables: @responsables }, status: 200
	end

end
