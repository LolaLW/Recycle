class CreateFavoris < ActiveRecord::Migration[7.0]
  def change
    create_table :favoris do |t|
      t.references :user, null: false, foreign_key: true
      t.references :produit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
