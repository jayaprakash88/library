class SocialSitesController < ApplicationController
	skip_before_filter :authenticate_user!
	layout false
 def create
	 auth= env["omniauth.auth"]
   auth_cred = auth["credentials"]
   session[:fb_token],session[:expires] = auth_cred["token"], auth_cred["expires_at"]  if auth['provider'] == 'facebook'
   @user = User.from_omniauth(auth)
	 sign_in :user,@user
	 redirect_to root_path
 end

 def load_image
 	@random_image = current_user.user_pictures.order("RANDOM()").first
 end
end


