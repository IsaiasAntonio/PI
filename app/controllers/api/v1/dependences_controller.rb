class Api::V1::DependencesController < ApplicationController
	def index
		@dependences = Dependence.all
		render json: {dependences: @dependences}
	end
end
