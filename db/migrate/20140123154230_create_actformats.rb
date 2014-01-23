class CreateActformats < ActiveRecord::Migration
  def change
    create_table :actformats do |t|
      t.integer :action_id
      t.integer :format_id

      t.timestamps
    end
  end
end
