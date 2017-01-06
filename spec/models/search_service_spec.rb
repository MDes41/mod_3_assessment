require 'rails_helper'


describe 'Search Service' do
	context 'Makes correct api call' do
		it 'returns a response with correct keys' do

			response = SearchService.search_by_zip(80202)

			json_parsed_response = JSON.parse(response.body, symbolize_names: true)

			expect(json_parsed_response).to be_kind_of(Hash)
			expect(json_parsed_response).to have_key(:total)
			expect(json_parsed_response).to have_key(:stores)
		end

		it 'returns a total number of stores' do

			response = SearchService.total(80202)

			expect(response).to eq(16)
		end

		it 'returns stores' do
			response = SearchService.stores(80202)

			expect(response).to be_kind_of(Array)
			expect(response.first).to have_key(:longName)
			expect(response.first).to have_key(:city)
			expect(response.first).to have_key(:distance)
			expect(response.first).to have_key(:storeType)
			expect(response.first).to have_key(:phone)
		end

		it 'store info makes a store model' do
			response = SearchService.store_info(80202)

			expect(response).to be_kind_of(Array)
			expect(response.first).to be_kind_of(Store)
			expect(response.first).to respond_to(:name)
			expect(response.first).to respond_to(:city)
			expect(response.first).to respond_to(:distance)
			expect(response.first).to respond_to(:type)
			expect(response.first).to respond_to(:phone)
		end
	end
end