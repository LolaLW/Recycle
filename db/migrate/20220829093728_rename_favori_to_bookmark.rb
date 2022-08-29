class RenameFavoriToBookmark < ActiveRecord::Migration[7.0]
  def change
    rename_table :favoris, :bookmarks
  end
end
