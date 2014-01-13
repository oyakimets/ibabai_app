class CreateProdcats < ActiveRecord::Migration
  def change
    create_table :prodcats do |t|
      t.string :name

      t.timestamps
    end
  end
end
