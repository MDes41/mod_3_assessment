class Api::V1::ItemsController < ApplicationController

	def index
		render json: Item.all, status: 200
	end

	def show
		render json: Item.find(params[:id]), status: 200
	end

	def destroy
		item = Item.find(params[:id])
		if item.delete
			render json: Item.all, status: 204
		end
	end

	def create
		item = Item.new(create_params)
		if item.save
			render json: Item.all, status: 201
		end
	end

	def create_params
		params.permit(:name, :description, :image_url)
	end
end