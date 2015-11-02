class FriendsController < ApplicationController
  # load_and_authorize_resource :class => "Book", :instance_name => "book"
  def index
  #authorize! :roll, :logs
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
    @fb_friends = FbGraph::User.me('CAACEdEose0cBAA7SvhNwKVAPmZAFKzHz2vZAImC4eX5XZBfW8ab8KxFN62jHzD0ngsDqZAyRPqVJ48eZA61qqs1cslnQKs66puNreukQKqVZBYSKKDKgzW1QfHJc9zAeY0M4trrZBpWQq5RaZCrquZC2Pal1HlXLCFFGGg8wcz2IAomy5KRVNM43frOxgICdiWuPxTZAv7rvSBCQk6g2uyhkwY').friends
    render :layout=>false
  end
  #raise @fb_friends.inspect
end
