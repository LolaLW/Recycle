class RemoveTypeToWaste < ActiveRecord::Migration[7.0]
  def change
    remove_reference :wastes, :type, index: true
  end
end
