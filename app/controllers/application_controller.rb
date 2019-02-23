class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_effective_user
  helper_method :current_effective_user_is_trainer?
  helper_method :current_effective_user_logged_in_as_client?

  
  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue StandardError
      session.delete(:user_id)
      @current_user = nil
    end
  end

  def current_effective_user
    begin
      @current_effective_user ||= User.find(session[:effective_id]) if session[:effective_id]
    rescue StandardError
      session.delete(:effective_id)
      @current_effective_user = nil
    end
  end
  
  def current_effective_user_logged_in_as_client?
    return (session[:effective_id] != session[:user_id])
  end
  
  def current_effective_user_is_trainer?
    if current_effective_user.nil? then
      return false
    end
    
    return (self.current_effective_user_logged_in_as_client? or 
            current_effective_user.is_trainer?)
  end
 
end
