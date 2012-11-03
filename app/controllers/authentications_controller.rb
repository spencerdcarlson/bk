class AuthenticationsController < ApplicationController
  def index
      @authentications = Authentication.all
  end
  
  def create
    omniauth = request.env['omniauth.auth']
    @authentication = Authentication.where(uid: omniauth['uid'], provider: omniauth['provider']).first
    if @authentication
      # already have the authentication, sign in the user
      cookies[:auth_token] = @authentication.user.auth_token
      flash[:notice] = 'Logged in'
    elsif current_user
      # user logged in, add the authenticaiton
      @authentication = current_user.authentications.build
      @authentication.provider = omniauth['provider']
      @authentication.uid =  omniauth['uid']
      @authentication.image_url = omniauth['info']['image']
      @authentication.save!
      flash[:notice] = "Added athentication via #{omniauth['provider'].capitalize}"
    else
      # user logged out, add user and authentication
      if @user = User.find_by_email(omniauth['info']['email'])
         @user.email = omniauth['info']['email']
      else
         @user = User.new
         @user.email = omniauth['info']['email']
         @user.password_digest = 0
      end
      @authentication = @user.authentications.build
      @authentication.provider = omniauth['provider']
      @authentication.uid =  omniauth['uid']
      @authentication.image_url = omniauth['info']['image']
      @user.save!
      @authentication.save!
      cookies[:auth_token] = @authentication.user.auth_token
      flash[:notice] = 'Now Registered'
    end
    respond_to do |format|
       format.html {redirect_to home_path }
       format.js { render js: "window.location.pathname='"+home_path+"'" }
    end
    
 end
    
  
  def failure
    flash[:alert] = 'Authentication Failure'
    redirect_to root_url
  end
  
  def returning
     respond_to do |format|
        format.js do
           @authentication = Authentication.where(uid: params[:uid], provider: params[:provider]).first
           if @authentication
             cookies[:auth_token] = @authentication.user.auth_token
             flash[:notice] = "logged in"
             render js: "window.location.pathname='"+home_path+"'"
           end
        end
     end
  end
  
  

  
   
end
