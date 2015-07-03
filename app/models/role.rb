class Role < ActiveRecord::Base
  attr_accessible :name, :status
  validates :name,:uniqueness=>true  
  has_many :users
end
