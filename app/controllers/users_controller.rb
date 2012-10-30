class UsersController < ApplicationController
  def index
    @users = User.all
  end
    
  
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
    if current_user.is_admin? && params[:id]
      @user = User.find params[:id]
      flash[:notice] = "#{@user.email}'s profile was updated"
    else
      @user = current_user
      flash[:notice] = 'Profile Updated'
    end
    if @user.update_attributes params[:user] 
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
