class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
#  before_action :authenticate_user!
  
  layout 'homepage'

  helper_method :resource, :resource_name, :devise_mapping

  private

  def after_sign_out_path_for(resource)
    if resource.eql?(:user)
      root_path
    end 
  end

  def after_sign_in_path_for(resource)
    if resource.class.eql?(User)
       session[:previous_url] || root_path
    end
  end

  def after_sign_up_path_for(resource)
    if resource.eql?(:user)
       root_path
    end
  end
 

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    if (request.fullpath != "/users/sign_in" &&
        request.fullpath != "/users/sign_up" &&
        request.fullpath != "/users/password" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath 
    end
  end

end
