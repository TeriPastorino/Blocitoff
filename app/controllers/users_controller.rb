class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index

  end

  def update
  end

  def show
    @user = current_user
    #@items = 
  end
end
