class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
     @sum = 0
  end

  def update
  end

  def destroy
    cart_items = CartItems.find(params[:id])
    cart_items.destroy
  end

  def destroy_all
    current_customer.cart_items.destroy_all
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: cart_item.item_id) #CartItem.find_by(item_id: cart_item.item_id, customer_id: current_customer.id)
      cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.update(amount: cart_item.amount)
    else
      cart_item.customer_id = current_customer.id
      cart_item.save
    end
    redirect_to cart_items_path
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
