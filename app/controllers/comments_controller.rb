class CommentsController < ApplicationController
  
  def create
    @comment = current_user.comments.build(params[:comment])
    @comments = Comment.where(place_id: @comment.place_id)
    if @comment.save 
      flash[:notice] = "Comment added"
    else
      flash[:notice] = "Error adding new comment"
    end
    respond_to do |format|
      format.js { render 'update' } 
    end
  end
  
  def destroy
    @comment = current_resource
    @comments = Comment.where(place_id: @comment.place_id)
    if @comment.destroy 
      flash[:notice] = "Comment deleted"
    else
      flash[:notice] = "Error deleting new comment"
    end
    respond_to do |format|
      format.js { render 'update' }
    end
  end
  
private
  def current_resource
    @current_resource ||= Comment.find(params[:id]) if params[:id]
  end
  
  
end
