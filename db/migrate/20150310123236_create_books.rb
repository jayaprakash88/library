class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :book_name
      t.string :author_name
      t.integer :rate
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
