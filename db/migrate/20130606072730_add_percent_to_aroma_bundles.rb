class AddPercentToAromaBundles < ActiveRecord::Migration
  def change
    add_column :aroma_bundles, :percent, :decimal
  end
end
