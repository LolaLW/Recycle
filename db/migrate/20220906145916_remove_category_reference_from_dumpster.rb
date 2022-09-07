class RemoveCategoryReferenceFromDumpster < ActiveRecord::Migration[7.0]
  def change
    remove_column :dumpsters, :category_id, index: true, foreign_key: true
  end
end
