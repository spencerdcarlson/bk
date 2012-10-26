class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_path = session[:protected_page] ? session[:protected_page] : home_path
      session[:protected_page] = nil
      redirect_to redirect_path, :notice => 'Logged in'
    else
      flash.now.alert = "Invalid Email or Password"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to login_path, :notice => 'Loggedout'
  end
  
end
