class CampusLocationsController < ApplicationController
	def index
		@campus = CampusLocation.all
		render json: @campus
	end
end
