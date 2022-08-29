class AddWasteToBookmark < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookmarks, :waste, index: true
  end
end
