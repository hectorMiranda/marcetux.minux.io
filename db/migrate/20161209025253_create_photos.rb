class CreatePhotos< ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :title
      t.text :body
      t.text :description
      t.string :slug

      t.timestamps
    end
    add_index :photos, :slug, unique: true
  end
end
