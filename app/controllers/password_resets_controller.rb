class PasswordResetsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user
      user.send_password_reset 
      flash[:notice] = "Email has been sent with reset instructions."
      redirect_to login_path
    else
      render 'new'
    end  
  end
  
  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end
  
  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      flash[:alert] = 'Password rest has expired.'
      redirect_to new_password_reset_path
    elsif @user.update_attributes(params[:user])
      flash[:notice] = 'Password reset.'
      redirect_to root_url
    else
      render 'edit'
    end
  end
  
end
