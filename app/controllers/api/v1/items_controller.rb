class Api::V1::ItemsController < ApplicationController

	def index
		render json: Items.all, status: 200
	end

	
end
