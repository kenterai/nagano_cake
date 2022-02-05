class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    @items_all = Item.all.where(is_active: 'true')
    @items = Item.limit(8).order('id DESC').where(is_active: 'true')
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end

end
