class Api::V1::MovementTagsController < ApplicationController
	def index
		@movement_tags = MovementTag.all
		render json: { movement_tags: @movement_tags }, status: 200
	end
end
