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
      redirect_to user_path(current_user)
    end    
  end
    
    def update
      if @item.update(item_params)
    end


  end

  def destroy
    @item = Item.find(params[:id])
    description = @item.description


    if @item.destroy
      flash[:notice] = "\"#{description}\" was deleted successfully."
    else
      flash[:error] = "There was an error deleting the item. Please try again."
    end

    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:description)
  end

end
