class SearchService

	def self.search_by_zip(zip)
		Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?apiKey=#{ENV['BB_API_KEY']}&format=json&show=longName,city,distance,phone,storeType")
	end

	def self.stores(zip)
		response = search_by_zip(zip) 
		JSON.parse(response.body, symbolize_names: true)[:stores]
	end

	def self.total(zip)
		response = search_by_zip(zip)
		JSON.parse(response.body, symbolize_names: true)[:total]
	end

	def self.store_info(zip)
		stores(zip).map do |store|
			Store.new(store)
		end
	end

	private
		attr_reader :response
end