class AddGraduateTypeToGraduates < ActiveRecord::Migration
  def change
   # add_column :graduates, :cource_type, :string
    add_column :graduates, :cource_id, :integer
  end
end
