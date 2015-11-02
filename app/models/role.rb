class Role < ActiveRecord::Base
  attr_accessible :name, :status
  validates :name,:uniqueness=>true  
  has_many :users
  
  def self.update_role
    role = Role.new(:name =>'wheneversds',:status =>true)
    role.save!
  end
  
  def self.log
    File.open("./role.txt", "a+"){|f| f << role.all.count }
  end
end
