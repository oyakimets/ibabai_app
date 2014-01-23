class CreateActsegments < ActiveRecord::Migration
  def change
    create_table :actsegments do |t|
      t.integer :action_id
      t.integer :segment_id

      t.timestamps
    end
  end
end
