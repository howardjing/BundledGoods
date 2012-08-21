class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to instructions_path
    else
      render :action => 'new'
    end
  end
 
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes params[:user]
      redirect_to thanks_path
    else 
      render :action => 'edit'
    end
  end
end
