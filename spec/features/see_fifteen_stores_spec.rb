require 'rails_helper'


describe 'Hit Best Buy API' do
	context 'Search for stores in area code' do
		it 'returns 15 stores' do

				visit '/'

				fill_in "search", with: "80202"
				click_on "Search"

				expect(current_path).to eq('/search')
				expect(page).to have_content("16 Stores Total")
				expect(page).to have_selector('div', 'store 15')
				expect(page).to have_content("Long Name")
				expect(page).to have_content("City")
				expect(page).to have_content("Distance")
				expect(page).to have_content("Phone Number")
				expect(page).to have_content("Store Type")
		end
	end
end