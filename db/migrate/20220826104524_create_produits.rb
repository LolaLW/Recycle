class CreateProduits < ActiveRecord::Migration[7.0]
  def change
    create_table :produits do |t|
      t.string :name
      t.string :description
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
