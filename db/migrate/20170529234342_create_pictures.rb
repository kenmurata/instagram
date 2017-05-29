class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      
      t.string :title
      t.string :image_url
      t.text :comment

      t.timestamps null: false
    end
  end
end
