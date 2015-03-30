class SocialSitesController < ApplicationController
	skip_before_filter :authenticate_user!
	layout false
 def create
	 auth = env["omniauth.auth"]
	 session[:fb_token] = auth["credentials"]["token"] if auth['provider'] == 'facebook'
	 @user = User.from_omniauth(auth)
	 #raise auth.inspect
	 sign_in :user,@user
	 redirect_to root_path
 end
end