class UserImagesController < ApplicationController
  def index
    @banner_images = Image.where(user_id: current_user, image_type: 'banner')
    @default_images = Image.where(user_id: current_user, image_type: 'default')
    @image = Image.new
  end

  def update
    @image = current_resource
    if @image.update_attributes(params[:image])
      flash[:notice] = 'Image updated'
    else
      flash[:notice] = 'Error updating image'
    end
  end
  
  def create
    @image = current_user.images.build(params[:image])
    @image.rating = 0
    if @image.save
      flash[:notice] = 'Image added'
    else
      flash[:notice] = 'Error adding Image'
    end
    respond_to do |format|
      format.js { render 'update' }
    end
  end
  
  def destroy
    @image = current_resource
    if @image.destroy
      flash[:notice] = 'Image deleted'
    else
      flash[:notice] = 'Error deleting image'
    end
    respond_to do |format|
      format.js { render 'update' }
    end
  end

private
  def current_resource
    @current_resource ||= current_user.images.find(params[:id]) if params[:id]
  end
  
end
