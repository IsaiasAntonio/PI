class Api::V1::UserController < ApplicationController
	before_action :authenticate_user!

	def index
		render json: { user: current_user }, status: 200
	end

end
