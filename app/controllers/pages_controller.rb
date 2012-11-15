class PagesController < ApplicationController
  
  before_filter :require_user
  
  def instructions
  end
  
  def thanks
  end
  
end