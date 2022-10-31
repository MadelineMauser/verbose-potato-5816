require 'rails_helper'

RSpec.feature "Item Index Page", type: :feature do
  describe 'when visiting the page' do
    before :each do
      @supermarket_1 = Supermarket.create!(name: 'Mountain Market', location: '123 Cherry St.')
      @supermarket_2 = Supermarket.create!(name: 'Wholesome Fresh', location: '456 Albacore St.')
      @item_1 = @supermarket_1.items.create!(name: 'Grapes', price: 4)
      @item_2 = @supermarket_1.items.create!(name: 'Steak', price: 10)
      @item_3 = @supermarket_2.items.create!(name: 'Pasta', price: 6)
      @customer_1 = @item_1.customers.create!(name: 'John Doe')
      @customer_2 = @item_1.customers.create!(name: 'Sally Smith')
      @customer_3 = @item_1.customers.create!(name: 'Jared White')
      @customer_4 = @item_2.customers.create!(name: 'Millie Bright')
    end
    it 'has a list of all items' do
      visit "/items"
      
      expect(page).to have_content("Grapes")
      expect(page).to have_content("Steak")
      expect(page).to have_content("Pasta")
    end
    it 'displays the info of each item plus a count of customers that have bought the item' do
      visit "/items"
      
      expect(page).to have_content("Price: 4")
      expect(page).to have_content("Price: 10")
      expect(page).to have_content("Price: 6")
      expect(page).to have_content("Supermarket: Mountain Market")
      expect(page).to have_content("Supermarket: Wholesome Fresh")
      expect(page).to have_content("Customer count: 3")
      expect(page).to have_content("Customer count: 1")
      expect(page).to have_content("Customer count: 0")
    end
  end
end