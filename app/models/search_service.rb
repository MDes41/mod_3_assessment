class SearchService

	def method_name
		
	end

	def self.search_by_zip(zip)
		Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?apiKey=#{ENV['BB_API_KEY']}&format=json&show=longName,city,distance,phone,storeType")
	end

	def stores

	end

end