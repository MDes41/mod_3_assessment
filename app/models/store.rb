class Store

	attr_reader :name, :city, :distance, :type, :phone
	
	def initialize(store)
		@name = store[:longName]
		@city = store[:city]
		@distance = store[:distance]
		@type = store[:storeType]
		@phone = store[:phone]
	end
end