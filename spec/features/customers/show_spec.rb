require 'rails_helper'

RSpec.feature "Customer Show Page", type: :feature do
  describe 'when visiting the page' do
    before :each do
      @supermarket_1 = Supermarket.create!(name: 'Mountain Market', location: '123 Cherry St.')
      @supermarket_2 = Supermarket.create!(name: 'Wholesome Fresh', location: '456 Albacore St.')
      @customer = Customer.create!(name: 'John Doe')
      @item_1 = @customer.items.create!(name: 'Grapes', price: 4, supermarket_id: @supermarket_1.id)
      @item_2 = @customer.items.create!(name: 'Pasta', price: 6, supermarket_id: @supermarket_2.id)
    end
    it 'has the name of the customer' do
      visit "/customers/#{@customer.id}"

      expect(page).to have_content("John Doe")
    end
    it 'has a list of all items of the customer' do
      visit "/customers/#{@customer.id}"
      
      expect(page).to have_content("Grapes")
      expect(page).to have_content("Pasta")
    end
    it 'displays the info of each item' do
      visit "/customers/#{@customer.id}"
      
      expect(page).to have_content("Price: 4")
      expect(page).to have_content("Price: 6")
      expect(page).to have_content("Supermarket: Mountain Market")
      expect(page).to have_content("Supermarket: Wholesome Fresh")
    end
  end
end
