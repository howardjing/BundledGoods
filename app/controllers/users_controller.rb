class UsersController < ApplicationController
  before_filter :require_user, only: [:edit, :update]
  
  def new
    sign_out
    @user = User.new
  end
  
  def create
    @user = User.new
    if @user.update_attributes(params[:user])
      sign_in @user
      redirect_to instructions_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if current_user.update_attributes(params[:user])
      redirect_to thanks_path
    else
      render :edit
    end
  end
    
end