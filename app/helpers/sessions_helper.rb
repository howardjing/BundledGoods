module SessionsHelper
  
  def sign_in(user)
    logger.debug 'Signing in...'
    session[:remember] = user.id
    @current_user = user
  end
  
  def sign_out
    session[:remember] = nil
    @current_user = nil
  end
  
  def current_user
    user = User.find_by_id(session[:remember])
    @current_user ||= user
  end
  
end