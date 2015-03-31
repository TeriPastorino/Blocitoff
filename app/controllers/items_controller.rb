class ItemsController < ApplicationController
  

  def index
    @item = Item.visible_to(current_user)
  end

  #initialize task as instance variable
  def new
    @item = Item.new
  end

  def create

    @item = current_user.items.build(item_params)
    if @item.save
      respond_to do |format|
        format.html { redirect_to user_path(current_user), notice: "\"#{description}\" was added successfully." }
        format.js

      end    
    else 
      flash[:error] = "Error adding item. Please try again."
      redirect_to user_path(current_user)


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
