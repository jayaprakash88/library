class UserPicture < ActiveRecord::Base
  attr_accessible :user_id,:photo
  belongs_to :user

  has_attached_file :photo,  :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
    :path => "public/system/:class/photo/:id/:style/:filename",
    :url => "/system/:class/photo/:id/:style/:basename.:extension",
    :default_url => "/images/:style/missing.png"
  do_not_validate_attachment_file_type :photo
end
