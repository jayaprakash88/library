# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
    roles = Role.create([{name:'Admin User',status:true},{name:'Limited User',status:true}])
    graduate = Graduate.create([{name:'Under Graduate'},{name:'Post Graduate'}])
    


###### creating ug graduate
file = "#{Rails.root}/public/defalult_migration/ug_graduate.csv"
CSV.foreach(file) do |row|
  column = row[0].split(",")
  graduate = Graduate.find_by_name("Under Graduate").id
  if graduate
    dep = Department.create(:name => column[0].strip,:cource_id => graduate)
    puts dep.name
  end
end
######  ug graduate end


###### creating pg graduate
file = "#{Rails.root}/public/defalult_migration/pg_graduate.csv"
CSV.foreach(file) do |row|
  column = row[0].split("$")
  graduate = Graduate.find_by_name("Post Graduate").id
  if graduate
    dep = Department.create(:name => column[0].strip,:cource_id => graduate)
    puts dep.name
  end
end
######  pg graduate end
    
