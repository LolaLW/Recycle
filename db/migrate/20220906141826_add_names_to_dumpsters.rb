class AddNamesToDumpsters < ActiveRecord::Migration[7.0]
  def change
    add_column :dumpsters, :name, :string
  end
end
