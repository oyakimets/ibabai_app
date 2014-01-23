class CreateActcities < ActiveRecord::Migration
  def change
    create_table :actcities do |t|
      t.integer :action_id
      t.integer :city_id

      t.timestamps
    end
  end
end
