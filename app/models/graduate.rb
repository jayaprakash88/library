class Graduate < ActiveRecord::Base
  attr_accessible :name,:cource_id
  validates :name,:uniqueness=>true  
  has_many :departments, :foreign_key => "cource_id"
  has_many :books
end
