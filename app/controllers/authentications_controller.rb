class AuthenticationsController < ApplicationController

	before_action :authenticate_user!, :except => [:twitter]

	def index
    @authentications = Authentication.all
  end

  def twitter
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      sign_in authentication.user
      redirect_to root_path
    elsif current_user
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      redirect_to root_path
    else
      user = User.new
      user.apply_omniauth(omniauth)
      byebug
      if user.save
        sign_in_and_redirect(:user, user)
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    end
  end


  protected

  def handle_unverified_request
	  true
	end

end
