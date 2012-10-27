class ActivitiesController < ApplicationController
  
  
  def index
    @activities = Activity.all
    @activity = Activity.new
  end
  
  def create
    @activity = Activity.new(params[:activity])
    if @activity.save
      redirect_to activities_path, :notice => "#{@activity.name} sucessfully created"
    else
      redirect_to activities_path, :notice => "#{@activity.name} wasn't created"
    end
  end
  
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to activities_path, :notice => "#{@activity.name} deleted"
  end
  
end
