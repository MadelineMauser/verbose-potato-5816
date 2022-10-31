class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @customer_items = @customer.items
  end

  def update
    if params[:commit] == 'Add'
      CustomerItem.create(customer_id: params[:id], item_id: params[:add_item_id])
    end
    redirect_to "/customers/#{params[:id]}"
  end
end