class Api::V1::MovementTagsController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
	before_action :authenticate_user!, :except => [:index, :show]

	def index
		@movement_tags = MovementTag.all
		render json: { movement_tags: @movement_tags }, status: 200
	end

	def show
		get_movement_tag
		render json: { movement_tag: @movement_tag }, status: 200
	end

	def create
		@movement_tag = MovementTag.new(movement_tag_params)
		if @movement_tag.save
			render json: { movement_tag: @movement_tag }, status: 201
		else
			render json: { error: "El tag no se ha podido generar" }, status:422
		end
	end

	def edit
		get_movement_tag
		render json: { movement_tag: @movement_tag }, status: 200
	end

	def update
		get_movement_tag
		if @movement_tag.update(movement_tag_params)
			render json: { movement_tag: @movement_tag }, status: 202
		else
			render json: { error: "El tag no pudo ser actualizada" }, status: 422
		end
	end

	def destroy
		get_movement_tag
		if @movement_tag.destroy
			render json: { status: "Borrado" }, status: 202
		else
			render json: { error: "No se pudo borrar el tag" }, status: 422
		end
	end

	private
	def movement_tag_params
		params.require(:movement_tag).permit(:name)
	end

	def get_movement_tag
		@movement_tag ||= MovementTag.find(params[:id])
	end

	def render_record_not_found
		render json: { error: "El tag no se encontró." }, status: 404
	end

end
