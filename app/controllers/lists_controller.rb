class ListsController < ApplicationController
  
  

  def show
    @list = List.find(params[:id])
  end

  
  private

  def list_params
    params.require(:list).permit(:title, :description)
  end
end
