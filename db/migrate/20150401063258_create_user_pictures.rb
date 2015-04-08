class CreateUserPictures < ActiveRecord::Migration
  def change
    create_table :user_pictures do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
