class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(list_params)
    item.save
    redirect_to '/admin/items/[:id]'
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price)
  end
end
