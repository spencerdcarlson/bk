class InterestsController < ApplicationController
  
  
  def new
    @activities = Activity.all
    @user = current_user
    @interest = Interest.new
  end
  
  def create
    @interest = Interest.new(activity_id: params[:activity_id], user_rating: params[:user_rating])
    @interest.user_id = current_user.id if current_user
    @interest.save
    flash[:notice] = "#{(Activity.where(id: @interest.activity_id).first.name)} was added to your interests"
    respond_to do |format|
      format.html { if @interest.save then redirect_to home_path else render "new" end }
      format.js { render 'update' }
    end
    
  end
  
  def update
    @interest = current_resource
    @interest.user_rating = params[:user_rating]
    @interest.save
    @activity = (Activity.where(id: @interest.activity_id).first)
    flash[:notice] = "Your rating for #{@activity.name} was updated to #{@interest.user_rating}"
    respond_to do |format|
      format.html
      format.js 
    end
  end
  
  def destroy
    @interest = current_resource
    @activity = (Activity.where(id: @interest.activity_id).first)
    @interest.destroy
    @activities = Activity.all
    flash[:notice] = "#{@activity.name} was removed to your interests"
    respond_to do |format|
      format.html { redirect_to home_path }
      format.js { render 'update' }
    end
  end

private
  
  def current_resource
    @current_resource ||= Interest.find(params[:id]) if params[:id]
  end
  
    
end
