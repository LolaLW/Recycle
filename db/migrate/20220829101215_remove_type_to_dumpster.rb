class RemoveTypeToDumpster < ActiveRecord::Migration[7.0]
  def change
    remove_reference :dumpsters, :type, index: true
  end
end
