class ItemsController < ApplicationController
  def index
  end


  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @lists = @list.items
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to @item, notice "Items successfully added to List."
      else
        flash[:error] = "Error adding item. Please try again."
        render:new
      end
    end
    #@item.list = @list
    #@item.save!


  end

  def destroy
    @item = Item.find(item_params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:body)
  end

end
