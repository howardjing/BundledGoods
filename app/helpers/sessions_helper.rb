module SessionsHelper

  def sign_in(user)
    session[:remember_token] = user.id
    self.current_user = user
  end

  def sign_out
    session[:remember_token] = nil
    @current_user = nil
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    user = User.find_by_id(session[:remember_token])
    @current_user ||= user
  end

end
