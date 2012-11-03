class InterestsController < ApplicationController
  
  
  def new
    @activities = Activity.all
    @user = current_user
    @interest = Interest.new
  end
  
  def create
    @interest = current_user.interests.build(params[:interest])
    if @interest.save 
      flash[:notice] = "#{(Activity.where(id: @interest.activity_id).first.name)} was added to your interests"
    else
      flash[:notice] = "Error occurred while trying to add #{(Activity.where(id: @interest.activity_id).first.name)} to your interests"
    end 
    respond_to do |format|
      format.html { if @interest.save then redirect_to home_path else render "new" end }
      format.js { render 'update' }
    end
  end
  
  def update
    @interest = current_resource
    if @interest.update_attributes(params[:interest])
      flash[:notice] = "Your rating for #{@interest.activity.name} was updated to #{@interest.user_rating}"
    else
      flash[:notice] = "Error occurred while trying to update your rating for #{@interest.activity.name}"
    end
    respond_to do |format|
      format.html
      format.js 
    end
  end
  
  def destroy
    @interest = current_resource
    activity = @interest.activity
    if @interest.destroy
      flash[:notice] = "#{activity.name} was removed to your interests"
    else
      flash[:notice] = "Error occured while trying to remove #{activity.name} from your interests"
    end
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
