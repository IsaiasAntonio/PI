class Api::V1::CampusLocationsController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found

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

	def update
		@campus_location = CampusLocation.find(params[:id])
		if @campus_location.update(campus_location_params)
			render json: { campus_location: @campus_location }, status: 200
		else
			render json: { error: "La locación del campus no pudo ser actualizada." }, status: 422
		end
	end

	def destroy
		@campus_location = CampusLocation.find(params[:id])
		if @campus_location.destroy
			render json: { status: "Deleted" }, status: 200
		else
			render json: { error: "No se pudo borrar la locación del campus" }, status: 422
		end
	end

	private
	def campus_location_params
		params.require(:campus_location).permit(:name)
	end

def render_record_not_found
	render json: { error: "La locación del campus no se encontró." }, status: 404
end
end
