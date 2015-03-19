class ListsController < ApplicationController
  
  # need to add some authorization
  #before_action :current_user?
  
  def index
    @lists = List.visible_to(current_user)
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.build(list_params)
  end


  def show
    @list = List.find(params[:id])
  end

  def edit

  end

  private

  def list_params
    params.require(:list).permit(:title, :description)
  end
end
