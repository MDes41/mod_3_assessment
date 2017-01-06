require 'rails_helper'


describe 'Api controller' do
	context 'When request is made to api/v1/items' do
		it 'returns all items' do

			# 10.times do 
			# 	create :item
			# end

			get '/api/v1/items'

			expect(page).to have_content()

		end
	end
end