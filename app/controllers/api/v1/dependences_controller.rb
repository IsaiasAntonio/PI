class Api::V1::DependencesController < ApplicationController
	def index
		@dependences = Dependence.all
		render json: { dependences: @dependences }, status: 200
	end

	def show
		get_dependence
		render json: { dependence: @dependence }, status: 200
	end

	def edit
		get_dependence
		render json: { dependence: @dependence }, status: 200
	end

	private
	def dependence_params
		params.require(:dependence).permit(:name, :campus_location_id)
	end

	def get_dependence
		@dependence ||= Dependence.find_by(id: params[:id])
	end

	def render_record_not_found
		render json: { error: "La dependencia no se encontró." }, status: 404
	end
end
