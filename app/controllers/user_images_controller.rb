class UserImagesController < ApplicationController
  def index
    @banner_images = Image.where(user_id: current_user, image_type: 'banner')
    @default_images = Image.where(user_id: current_user, image_type: 'default')
  end

  def update
    @image = Image.find(params[:id])
    if @image.update_attributes(params[:image])
      flash[:notice] = 'Image updated'
    else
      flash[:notice] = 'Error updating image'
    end
  end
  
  
  
end
