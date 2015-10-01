class CreateDogPictures < ActiveRecord::Migration
  def change
    create_table :dog_pictures do |t|
      t.string :url
      t.string :name

      t.timestamps null: false
    end
  end
end
