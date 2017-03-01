class AddPublishedToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :published, :boolean, default: false
    add_column :photos, :published_at, :datetime
    add_column :photos, :private, :boolean, default: true
  end
end
