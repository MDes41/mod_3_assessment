class SearchController < ApplicationController

	def index
		params[:search]
		response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{params[:search]},25))?apiKey=#{ENV['BB_API_KEY']}&format=json&show=longName,city,distance,phone,storeType")
		byebug
	end
end