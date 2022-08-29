class AddCategoryToDumpster < ActiveRecord::Migration[7.0]
  def change
    add_reference :dumpsters, :category, index: true
  end
end
