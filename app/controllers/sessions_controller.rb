class SessionsController < ApplicationController
  def new
  end
  
  def create
    # user =  User.find_by_omniauth("omniauth.auth") || User.find_by_email(params[:email])
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
         cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_path = session[:protected_page] ? session[:protected_page] : home_path
      session[:protected_page] = nil
      redirect_to redirect_path, :notice => 'Logged in'
    else
      flash.now.alert = "Invalid Email or Password"
      render "new"
    end
  end
  
  def destroy
    cookies.delete(:auth_token)
    render '/static_pages/logout' , :notice => 'Loggedout'
  end
  
end
