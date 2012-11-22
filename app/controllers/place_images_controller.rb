class PlaceImagesController < ApplicationController
  def index
    @place = current_resource
    @images = @place.images.sort{|x,y| x.rating <=> y.rating }.reverse
    @image = Image.new
    respond_to do |format|
      format.html 
    end
  end
  
private
  def current_resource
    @current_resource ||= Place.find(params[:place_id]) if params[:place_id]
  end
  
end
