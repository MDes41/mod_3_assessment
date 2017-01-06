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
	end
end