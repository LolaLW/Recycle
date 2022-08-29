class RenameTypeToCategory < ActiveRecord::Migration[7.0]
  def change
    rename_table :types, :categories
  end
end
