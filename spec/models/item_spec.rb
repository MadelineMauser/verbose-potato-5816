require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items}
    it { should have_many(:customers).through(:customer_items)}
  end

  describe 'instance methods' do
    describe '.supermarket_name' do
      it 'should return the supermarket name of the item' do
        @supermarket_1 = Supermarket.create!(name: 'Mountain Market', location: '123 Cherry St.')
        @item_1 = @supermarket_1.items.create!(name: 'Grapes', price: 4)
        
        expect(@item_1.supermarket_name).to eq('Mountain Market')
      end
    end
  end
end
