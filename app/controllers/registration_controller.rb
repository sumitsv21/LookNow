class RegistrationController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters

  layout 'homepage'
	def new
		super
	end


	def create
    build_resource(sign_up_params)
    session[:omniauth] = nil unless @user.new_record?
    resource_saved = resource.save
    yield resource if block_given?
      if resource_saved
        if resource.active_for_authentication?
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        @validatable = devise_mapping.validatable?
        if @validatable
          @minimum_password_length = resource_class.password_length.min
        end
        respond_with resource
      end
  end

  private
  
  def build_resource(*args)
    super
    if session[:omniauth]
      @user.apply_omniauth(session[:omniauth])
      @user.valid?
    end
  end

  def after_sign_up_path_for(resource)
    if resource.class.eql?(User)
       '/'
    end
  end

  protected

  # my custom fields are :name, :heard_how
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation, :image, :provider, :token, :token_secret, :uid, :user_id)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :email, :password, :password_confirmation, :current_password, :image, :provider, :token, :token_secret, :uid, :user_id)
    end
  end

  
end
