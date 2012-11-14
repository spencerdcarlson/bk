class PlacesController < ApplicationController
  def index
    @places = Place.all
  end
  
  def new
  end
  
  def show
    @place = current_resource
    @default_images = Array(Image.where(place_id: current_resource, image_type: 'default').sort{|x,y| x.rating <=> y.rating }).reverse
    @banner_images =  Array(Image.where(activity_id: current_resource.activity_id, image_type: 'banner' ).sort{|x,y| x.rating <=> y.rating }).reverse
    @comments = @place.comments
    @comment = Comment.new
  end
  
private
  def current_resource
    @current_resource ||= Place.find(params[:id]) if params[:id]
  end
  
end
