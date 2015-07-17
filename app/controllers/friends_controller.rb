class FriendsController < ApplicationController
   load_and_authorize_resource :class => "Book", :instance_name => "book"
  def index
  
#    me = FbGraph::User.me(current_user.access_token)
#    album = me.album!(
#      :name => 'FbGraph test',
#      :message => 'test test test'
#    ) # => now facebook Graph API returns weird response for this call
#
#   
#    album = me.albums.select{|a| a.raw_attributes['name'] =='FbGraph test'}.first
#    album.photo!(
#      :access_token => current_user.access_token,
#      :source => File.new('/home/jayaprakash/Pictures/test.png','rb'), # 'rb' is needed only on windows
#      :message => 'Fbgraph Uploading photos'
#    ) 
#    @user_fb_token = current_user.access_token
#    @fb_friends = FbGraph::User.me(@user_fb_token)
#    puts "sdf sdfsdfsd f"
#    puts @fb_friends.friends
#    puts "sdf sdfsdfsd f"
  end
  
  def fb_friends
    @user_fb_token = current_user.access_token
    @fb_friends = FbGraph::User.me(@user_fb_token).friends
    render :layout=>false
  end
  #raise @fb_friends.inspect
end
