class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :gender
      t.integer :age
      t.string :income
      t.integer :city_id

      t.timestamps
    end
  end
end
