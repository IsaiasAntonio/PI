class DependencesController < ApplicationController
	def index
		@dependences = Dependence.all
		render json: { dependences: @dependences }
	end
end
