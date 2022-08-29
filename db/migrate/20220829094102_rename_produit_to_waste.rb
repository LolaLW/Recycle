class RenameProduitToWaste < ActiveRecord::Migration[7.0]
  def change
    rename_table :produits, :wastes
  end
end
