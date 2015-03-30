class Role < ActiveRecord::Base
  attr_accessible :name, :status
  has_many :users
end
