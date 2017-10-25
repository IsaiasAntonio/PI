class Api::V1::DependencesController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
	before_action :authenticate_user!

	def index
		@dependences = Dependence.all
		render json: { dependences: @dependences }, status: 200
	end

	def show
		get_dependence
		render json: { dependence: @dependence }, status: 200
	end

	def create
		@dependence = Dependence.new(dependence_params)
		if @dependence.save
			render json: { dependence: @dependence }, status: 201
		else
			render json: { error: "La dependencia no se ha podido generar" }, status:422
		end
	end

	def edit
		get_dependence
		render json: { dependence: @dependence }, status: 200
	end

	def update
		get_dependence
		if @dependence.update(dependence_params)
			render json: { dependence: @dependence }, status: 202
		else
			render json: { error: "La dependencia no pudo ser actualizada" }, status: 422
		end
	end

	def destroy
		get_dependence
		if @dependence.destroy
			render json: { status: "Borrado" }, status: 202
		else
			render json: { error: "No se pudo borrar la dependencia" }, status: 422
		end
	end

	private
	def dependence_params
		params.require(:dependence).permit(:name, :campus_location_id)
	end

	def get_dependence
		@dependence ||= Dependence.find(params[:id])
	end

	def render_record_not_found
		render json: { error: "La dependencia no se encontró." }, status: 404
	end
end
