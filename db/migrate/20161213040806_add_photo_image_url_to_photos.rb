class AddPhotoImageUrlToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :photo_url_original, :string
    add_column :photos, :photo_url_large, :string
    add_column :photos, :photo_url_medium, :string
    add_column :photos, :photo_url_small, :string
  end
end
