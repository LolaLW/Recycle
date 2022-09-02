class CreateDumpsters < ActiveRecord::Migration[7.0]
  def change
    create_table :dumpsters do |t|
      t.string :address

      t.timestamps
    end
  end
end
