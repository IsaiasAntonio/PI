class Api::V1::CampusLocationsController < ApplicationController
	def index
		@campus_locations = CampusLocation.all
		render json: { campus_locations: @campus_locations }, status: 200
	end

	def show
		@campus_location = CampusLocation.find(params[:id])
		render json: { campus_location: @campus_location }, status: 200
	end

	def create
		@campus_location = CampusLocation.new(campus_location_params)
		if @campus_location.save
			render json: { campus_location: @campus_location }, status: 200
		else
			render json: { error: "El campus no se pudo generar" }, status: 422
		end
	end

	def edit
		@campus_location = CampusLocation.find(params[:id])
		render json: { campus_location: @campus_location }, status: 200
	end

	private
	def campus_location_params
		params.require(:campus_location).permit(:name)
	end
end
