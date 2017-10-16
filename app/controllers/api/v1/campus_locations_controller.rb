class Api::V1::CampusLocationsController < ApplicationController
	def index
		@campus = CampusLocation.all
		render json: {campus_locations: @campus}
	end
end
