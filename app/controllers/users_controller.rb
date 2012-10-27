class UsersController < ApplicationController
 
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      cookies[:auth_token] = @user.auth_token
      redirect_to home_path, :notice => 'Thanks for registering'
    else
      render "new"
    end
  end
  
  def show
    @user = current_user
    @activities = Activity.all
    @interest = Interest.new
  end
  
  def update
    @user = current_user
    if @user.update_attributes params[:user] 
      flash[:notice] = 'Profile Updated '
      respond_to do |format|
        format.html { redirect_to home_path }
        format.js 
      end
    else
      render 'edit'
    end
  end
  
  def edit
    @user = current_user
  end
  
  
  
end
