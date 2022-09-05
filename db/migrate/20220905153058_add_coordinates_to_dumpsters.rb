class AddCoordinatesToDumpsters < ActiveRecord::Migration[7.0]
  def change
    add_column :dumpsters, :latitude, :float
    add_column :dumpsters, :longitude, :float
  end
end
