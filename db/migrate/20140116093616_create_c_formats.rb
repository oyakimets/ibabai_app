class CreateCFormats < ActiveRecord::Migration
  def change
    create_table :c_formats do |t|
      t.integer :category_id
      t.integer :format_id

      t.timestamps
    end
  end
end
