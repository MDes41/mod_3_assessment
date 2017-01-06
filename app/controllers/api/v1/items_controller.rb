class Api::V1::ItemsController < ApplicationController

	def index
		render json: Item.all, status: 200
	end

	def show
		render json: Item.find(params[:id]), status: 200
	end

	def destroy
		Item.find(params[:id]).destroy
		render json: Item.all, status: 204
	end

	def create
		item = Item.new(params)
		if item.save
			render json: Item.all, status: 201
		end
	end

	params
		params(:name, :description, :image_url)
end