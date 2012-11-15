class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  private
  
  def require_user
    redirect_to new_user_path unless current_user
  end
  
end
