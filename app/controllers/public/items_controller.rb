class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  private
  def item_params
    params.require(:item).permit(:image)
  end
end
