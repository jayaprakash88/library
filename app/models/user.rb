class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :invitable, :invite_for => 2.weeks
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:profile_picture,:role_id,:provider,:uid,:access_token
  # attr_accessible :title, :body
  #devise :invitable, :timeoutable, :timeout_in => 30.seconds
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
    auth_info = auth.info
    auth_info_email = auth_info.email
  	user = User.find_by_email("#{auth_info_email}")
    #	raise user.inspect
    unless user
      user = User.new(:email => auth_info_email,:role_id=>1,:provider => auth.provider,:uid => auth.uid)
      auth_info_image = auth_info.image
      if auth_info_image.present?
        avatar_url = process_uri(auth_info_image)
        user.profile_picture = URI.parse(avatar_url)
      end
      #user.confirm!
    end
    user.access_token = auth.credentials.token
    user.save(:validate => false)
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
