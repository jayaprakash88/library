class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:profile_picture,:role_id,:provider,:uid,:access_token
  # attr_accessible :title, :body
  #devise :timeoutable, :timeout_in => 30.seconds
   has_attached_file :profile_picture,  :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
    :path => "public/system/:class/profile_picture/:id/:style/:filename",
    :url => "/system/:class/profile_picture/:id/:style/:basename.:extension",
    :default_url => "/images/:style/missing.png"
  do_not_validate_attachment_file_type :profile_picture
  belongs_to :role
  
  has_many :user_pictures, :dependent => :destroy
  accepts_nested_attributes_for :user_pictures, :reject_if => lambda { |a| a[:photo].blank? }, :allow_destroy => true


  def self.from_omniauth(auth)
  #	raise auth.inspect
  	user = User.find_by_email("#{auth.info.email}")
  #	raise user.inspect
	unless user
	  user = User.new(:email => auth.info.email,:role_id=>1,:provider => auth.provider,:uid => auth.uid,
	  	:access_token => auth.credentials.token)
	  if auth.info.image.present?
	  	 avatar_url = process_uri(auth.info.image)
		 user.profile_picture = URI.parse(avatar_url)
	  end
	  user.save(:validate => false)
	  #user.confirm!
    end
    return user
  end

  def self.process_uri(uri)
	require 'open-uri'
	require 'open_uri_redirections'
	open(uri, :allow_redirections => :safe) do |r|
	r.base_uri.to_s
   end
  end 
end
