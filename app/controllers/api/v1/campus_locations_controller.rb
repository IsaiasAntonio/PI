class Api::V1::CampusLocationsController < ApplicationController
	def index
		@campus_locations = CampusLocation.all
		render json: { campus_locations: @campus_locations }, status: 200
	end

	def show
		@campus_location = CampusLocation.find(params[:id])
		render json: { campus_location: @campus_location }, status: 200
	end

	private
	def resource_params
		params.require(:campus_location).permit(:id, :name)
	end
end
