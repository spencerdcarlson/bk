class PlaceImagesController < ApplicationController
  def index
    @place = Place.find(params[:place_id])
    @images = @place.images.sort{|x,y| x.rating <=> y.rating }.reverse
    respond_to do |format|
      format.html 
    end
  end
end
