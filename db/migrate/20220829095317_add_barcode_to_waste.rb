class AddBarcodeToWaste < ActiveRecord::Migration[7.0]
  def change
    add_column :wastes, :barcode, :integer
  end
end
