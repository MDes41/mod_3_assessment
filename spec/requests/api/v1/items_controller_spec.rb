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
			expect(response.status).to be(200)
			expect(js.count).to be(10)
			expect(js.first).to have_key(:name)
			expect(js.first).to have_key(:description)
			expect(js.first).to have_key(:image_url)

		end

		it 'returns one item' do
			item_one  = Item.create(name: 'name one', description: 'description one', image_url: 'image one')
			item  = Item.create(name: 'name', description: 'description', image_url: 'image')

			get '/api/v1/items/1'

			js = JSON.parse(response.body, symbolize_names: true)

			expect(js).to be_kind_of(Hash)
			expect(response.status).to be(200)
			expect(js).to have_key(:name)
			expect(js[:name]).to eq('name one')
			expect(js).to have_key(:description)
			expect(js[:description]).to eq('description one')
			expect(js).to have_key(:image_url)
			expect(js[:image_url]).to eq('image one')
		end

		it 'deletes one item' do
			item_one  = Item.create(name: 'name one', description: 'description one', image_url: 'image one')
			item_two  = Item.create(name: 'name two', description: 'description two', image_url: 'image two')
			item  = Item.create(name: 'name', description: 'description', image_url: 'image')

			delete '/api/v1/items/1'

			js = JSON.parse(response.body, symbolize_names: true)

			expect(js).to be_kind_of(Array)
			expect(response.status).to be(204)
			expect(js.count).to be(2)
			expect(js.first).to have_key(:name)
			expect(js.first).to have_key(:description)
			expect(js.first).to have_key(:image_url)
		end

		it 'deletes one item' do
			item_one  = Item.create(name: 'name one', description: 'description one', image_url: 'image one')
			item_two  = Item.create(name: 'name two', description: 'description two', image_url: 'image two')
			item  = Item.create(name: 'name', description: 'description', image_url: 'image')

			delete '/api/v1/items/1'

			js = JSON.parse(response.body, symbolize_names: true)

			expect(js).to be_kind_of(Array)
			expect(response.status).to be(204)
			expect(js.count).to be(2)
			expect(js.first).to have_key(:name)
			expect(js.first).to have_key(:description)
			expect(js.first).to have_key(:image_url)
		end
	end
end