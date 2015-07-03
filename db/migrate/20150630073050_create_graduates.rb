class CreateGraduates < ActiveRecord::Migration
  def change
    create_table :graduates do |t|
      t.string :name

      t.timestamps
    end
  end
end
