class AddReferenceToWaste < ActiveRecord::Migration[7.0]
  def change
    add_reference :wastes, :user, null: false, foreign_key: true
  end
end
