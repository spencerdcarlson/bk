class UsersController < ApplicationController
  before_filter :authorize, except: ['new','create']
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path, :notice => 'Thanks for registering'
    else
      render "new"
    end
  end
  
  def show
    @user = current_user
    @user_interests = Interest.where(user_id: current_user.id)
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
