require 'rails_helper'


describe 'Api controller' do
	context 'When request is made to api/v1/items' do
		it 'returns all items' do

			10.times do 
				item  = Item.create(name: 'name', description: 'description', image_url: 'image')
			end

			get '/api/v1/items'

			js = JSON.parse(response.body, symbolize_names: true)

			expect(js).to be_kind_of(Array)
			expect(js.count).to be(10)
			expect(js.first).to have_key(:name)
			expect(js.first).to have_key(:description)
			expect(js.first).to have_key(:image_url)

		end
	end
end