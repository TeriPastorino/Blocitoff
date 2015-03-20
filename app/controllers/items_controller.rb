class ItemsController < ApplicationController
  

  def index
    @items = Item.visible_to(current_user)
  end

  #initialize task as instance variable
  def new
    @item = Item.new
  end

  def create

    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to user_path(current_user), notice: "You have added an Item to your List."
    else
      flash[:error] = "Error adding item. Please try again."
      render:new
    end
  end
    
    def update
      if @item.update(item_params)
    end


  end

  def destroy
    @item = Item.find(item_params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:description)
  end

end
