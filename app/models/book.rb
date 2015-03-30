class Book < ActiveRecord::Base
  attr_accessible :author_name, :book_name, :description, :price, :rate,:attach
  do_not_validate_attachment_file_type :attach
  has_attached_file :attach, :path => "public/system/:class/attach_pdf/:id/:filename",
    :url => "/system/:class/attach_pdf/:id/:basename.:extension", :styles => { :pdf_thumbnail => ["", :jpg] }




end
