class EventImagesController < ApplicationController
  def index
    @event = current_resource
    @images = @event.images.sort{|x,y| x.rating <=> y.rating }.reverse
    @image = Image.new
    respond_to do |format|
      format.html 
    end
  end
  
private
  def current_resource
    @current_resource ||= Event.find(params[:id]) if params[:id]
  end
  
end
