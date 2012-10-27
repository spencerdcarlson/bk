class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize
  
  helper_method :current_user
  
private 
  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
  
  
  def current_permission
    @current_permission ||= Permission.new(current_user)
  end
  
  def authorize
    unless current_permission.allow?(params[:controller], params[:action])
      session[:protected_page] = request.fullpath
      redirect_to login_url, :alert => 'Not Authorized'
    end
    # unless current_user
    #       session[:protected_page] = request.fullpath
    #       redirect_to login_url, :alert => "Not Logedin"
    #     end
  end
  
end
