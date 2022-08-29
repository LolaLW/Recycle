class AddScheduleToDumpster < ActiveRecord::Migration[7.0]
  def change
    add_column :dumpsters, :schedule, :integer
  end
end
