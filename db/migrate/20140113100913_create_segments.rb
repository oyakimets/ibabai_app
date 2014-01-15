class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.string :name
      t.integer :user_id
      t.string :gender
      t.integer :age_min
      t.integer :age_max

      t.timestamps
    end
  end
end
