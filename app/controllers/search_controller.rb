class SearchController < ApplicationController

	def index
		response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{params[:search]},25))?apiKey=#{ENV['BB_API_KEY']}&format=json&show=longName,city,distance,phone,storeType")
		p_res = JSON.parse(response.body)
		results = SearchService.search_by_zip(params[:search])
	end
end