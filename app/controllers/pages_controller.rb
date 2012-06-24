class PagesController < ApplicationController

  before_filter :require_user

  def thanks
  end
  
  def instructions
  end

  private
  def require_user
    unless !current_user.nil?
      redirect_to new_user_path
    end
  end
end
