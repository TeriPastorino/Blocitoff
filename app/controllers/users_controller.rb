class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index

  end

  def update
  end

  def show
    @user = current_user
    #@item = @user.list
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
