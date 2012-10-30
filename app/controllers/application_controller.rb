class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize
  
  # allow_action?
  delegate :allow?, to: :current_permission
  helper_method :allow?
  
  delegate :allow_attr?, to: :current_permission
  helper_method :allow_attr?
  
  helper_method :current_user
  
private 
  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
  
  
  def current_permission
    @current_permission ||= Permissions.permission_for(current_user)
  end
  
  def current_resource
    nil
  end
  
  def authorize
    if current_permission.allow?(params[:controller], params[:action], current_resource)
      current_permission.permit_attr! params
    else
      if current_user
        flash[:alert] = 'Not Authorized'
        redirect_to home_path
      else
        session[:protected_page] = request.fullpath
        flash[:alert] = 'Please Login'
        redirect_to root_url
      end
    end
  end
  
end
