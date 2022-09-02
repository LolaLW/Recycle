class CreateDumpsters < ActiveRecord::Migration[7.0]
  def change
    create_table :dumpsters do |t|
      t.string :name

      t.timestamps
    end
  end
end
