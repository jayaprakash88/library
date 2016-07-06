require 'elasticsearch/model'
class Book < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks
  attr_accessible :author_name, :book_name, :description, :price, :rate,:attach,:graduate_id, :department_id
  attr_accessor :graduate_id,:department_id
  do_not_validate_attachment_file_type :attach
  #has_attached_file :attach,:storage => :s3,:s3_credentials => "#{Rails.root}/config/s3.yml",:bucket => "senecaglobal",:path => "uploaded_files/profile/:id/:style/:basename.:extension"
  has_attached_file :attach, :path => "public/system/:class/attach_pdf/:id/:filename",:url => "/system/:class/attach_pdf/:id/:basename.:extension", :styles => { :pdf_thumbnail => ["", :jpg] }
  belongs_to :graduate 
  belongs_to :department,:class_name=>'graduate'
  validates :author_name, :presence=>true
end
