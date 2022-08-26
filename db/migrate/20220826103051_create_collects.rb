class CreateCollects < ActiveRecord::Migration[7.0]
  def change
    create_table :collects do |t|
      t.string :name
      t.string :address
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
