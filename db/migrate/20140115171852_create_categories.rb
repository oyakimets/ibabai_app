class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :cat_format
      t.string :cat_chain

      t.timestamps
    end
  end
end
