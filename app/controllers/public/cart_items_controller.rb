class Public::CartItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def update
  end

  def destory
  end

  def destory_all
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    cart_item.save
    redirect_to cart_items_path
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end