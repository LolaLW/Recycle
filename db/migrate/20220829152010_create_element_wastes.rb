class CreateElementWastes < ActiveRecord::Migration[7.0]
  def change
    create_table :element_wastes do |t|
      t.references :waste, null: false, foreign_key: true
      t.references :element, null: false, foreign_key: true

      t.timestamps
    end
    remove_reference :elements, :waste, index: true
  end
end
