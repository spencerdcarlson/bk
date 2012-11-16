class ImagesController < ApplicationController
  def place_index
    @place = Place.find(params[:place_id])
    @images = @place.images.sort{|x,y| x.rating <=> y.rating }.reverse
    respond_to do |format|
      format.html { render 'place_index' }
    end
  end
  
  def user_index
    @banner_images = Image.where(user_id: current_user, image_type: 'banner')
    @default_images = Image.where(user_id: current_user, image_type: 'default')
  end
  
  def user_update
    @image = Image.find(params[:id])
    if @image.update_attributes(params[:image])
      flash[:notice] = 'Image updated'
    else
      flash[:notice] = 'Error updating image'
    end
  end
  
end
