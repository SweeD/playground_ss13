class CreateAromaBundles < ActiveRecord::Migration
  def change
    create_table :aroma_bundles do |t|
      t.integer :aroma_id
      t.integer :receipe_id

      t.timestamps
    end
  end
end
