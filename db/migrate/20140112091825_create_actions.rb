class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :name
      t.integer :brand_id
      t.datetime :start
      t.datetime :finish

      t.timestamps
    end
  end
end
