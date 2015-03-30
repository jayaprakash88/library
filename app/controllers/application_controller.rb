class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
   rescue_from CanCan::AccessDenied do | exception |
   	flash[:error] = exception.message
    redirect_to root_url, alert: exception.message
  end

  
  def facebook_logout
    token = current_user.access_token
    redirect_url = root_url    
    sign_out(:user)
    redirect_to "https://www.facebook.com/logout.php?next=#{redirect_url}&access_token=#{token}"    
  end
end
