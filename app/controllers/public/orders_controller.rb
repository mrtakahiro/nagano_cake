class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def check
  end

  def completion
  end

  def create
    order = Order.new(order_params)
    order.save
    redirect_to orders_check_path(post)
  end

  def index
  end

  def show
  end

  private
  def list_params
    params.require(:ordef).permit(:customer_id, :name, :postal_code, :address)
  end
end
