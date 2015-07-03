class Department < Graduate
  # attr_accessible :title, :body
  validates :name,:uniqueness=>true
  belongs_to :graduate, :foreign_key => "cource_id"
end
