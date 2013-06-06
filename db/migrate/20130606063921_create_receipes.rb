class CreateReceipes < ActiveRecord::Migration
  def change
    create_table :receipes do |t|
      t.string :name

      t.timestamps
    end
  end
end
