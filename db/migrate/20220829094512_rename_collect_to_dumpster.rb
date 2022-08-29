class RenameCollectToDumpster < ActiveRecord::Migration[7.0]
  def change
    rename_table :collects, :dumpsters
  end
end
