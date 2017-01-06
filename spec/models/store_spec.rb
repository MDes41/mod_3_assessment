require 'rails_helper'


describe 'Stores Spec' do
	context 'Creates a store' do
		it 'and responsds to attributes' do

			store = {
					      "longName": "Best Buy Mobile - Cherry Creek Shopping Center",
					      "city": "Denver",
					      "distance": 3.25,
					      "phone": "303-270-9189",
					      "storeType": "Mobile"
					    }

			store = Store.new(store)

			expect(store).to be_kind_of(Store)
			expect(store).to respond_to(:name)
			expect(store).to respond_to(:city)
			expect(store).to respond_to(:distance)
			expect(store).to respond_to(:type)
			expect(store).to respond_to(:phone)
		end
	end
end