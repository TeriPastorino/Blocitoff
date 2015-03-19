class ItemsController < ApplicationController
  

  def index
    @items = Item.visible_to(current_user)
  end

  #initialize task as instance variable
  def new
    @item = Item.new
  end

  def show
    @user = User.find()
    @item = Item.find(params[:id])
    @lists = @list.items
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to users_show_path notice "Items successfully added to List."
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
