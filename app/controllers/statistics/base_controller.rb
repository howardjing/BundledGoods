class Statistics::BaseController < ApplicationController 
  before_filter :require_admin
  
  protected

  def require_admin
    authenticate_or_request_with_http_basic do |username, password|
      username == "julian" && password == "julian"
    end
  end
end