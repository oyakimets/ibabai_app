class CreateActstores < ActiveRecord::Migration
  def change
    create_table :actstores do |t|
      t.integer :action_id
      t.integer :store_id

      t.timestamps
    end
  end
end
