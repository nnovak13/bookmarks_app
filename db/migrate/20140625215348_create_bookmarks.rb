class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :title, null: false, unique: true
      t.string :url, null: false
      t.string :category
      t.text :comment
      t.boolean :is_favorite, default: false

      t.timestamps
    end
  end
end
