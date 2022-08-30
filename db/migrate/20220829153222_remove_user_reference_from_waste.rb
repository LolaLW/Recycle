class RemoveUserReferenceFromWaste < ActiveRecord::Migration[7.0]
  def change
    remove_reference :wastes, :user, index: true
  end
end
