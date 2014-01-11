class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.integer :user_id
      t.integer :prodcat_id
      t.boolean :dropped

      t.timestamps
    end
  end
end
