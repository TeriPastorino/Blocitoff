class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
  end

  def destroy
    @item = Item.find(item_params[:id])
  end
end
