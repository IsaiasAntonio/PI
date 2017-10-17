class Api::V1::DependencesController < ApplicationController
	before_action :authenticate_user!
	def index
		@dependences = Dependence.all
		render json: { dependences: @dependences }, status: 200
	end
end
