class DependencesController < ApplicationController
	def index
		@dependences = Dependence.all
		render json: @dependences.to_json(:include => :campus_location) 
	end
end
