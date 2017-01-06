class SearchController < ApplicationController

	def index
		@total = SearchService.total(params[:search])
		@stores = SearchService.store_info(params[:search])
	end
end