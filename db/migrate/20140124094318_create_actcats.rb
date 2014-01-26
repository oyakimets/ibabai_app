class CreateActcats < ActiveRecord::Migration
  def change
    create_table :actcats do |t|
      t.integer :action_id
      t.integer :category_id

      t.timestamps
    end
  end
end
