class CreateElements < ActiveRecord::Migration[7.0]
  def change
    create_table :elements do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true
      t.references :waste, null: false, foreign_key: true

      t.timestamps
    end
  end
end
