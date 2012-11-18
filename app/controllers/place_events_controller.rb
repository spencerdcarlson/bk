class PlaceEventsController < ApplicationController
  def show
    @event = current_resource
    @default_images = Array(Image.where(event_id: current_resource, image_type: 'default').sort{|x,y| x.rating <=> y.rating }).reverse
    @banner_images =  Array(Image.where(activity_id: current_resource.place.activity_id, image_type: 'banner' ).sort{|x,y| x.rating <=> y.rating }).reverse
    @comments = @event.comments
    @comment = Comment.new
  end
  
private
  def current_resource
    @current_resource ||= Event.find(params[:id]) if params[:id]
  end
    
end
