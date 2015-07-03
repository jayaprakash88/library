class Book < ActiveRecord::Base
  attr_accessible :author_name, :book_name, :description, :price, :rate,:attach
  attr_accessor :graduate_id,:department_id
  do_not_validate_attachment_file_type :attach
  has_attached_file :attach,:storage => :s3,:s3_credentials => "#{Rails.root}/config/s3.yml",:bucket => "senecaglobal",:path => "uploaded_files/profile/:id/:style/:basename.:extension"

  belongs_to :graduate 
  belongs_to :department,:class_name=>'graduate'

end
