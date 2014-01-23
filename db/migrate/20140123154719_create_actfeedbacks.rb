class CreateActfeedbacks < ActiveRecord::Migration
  def change
    create_table :actfeedbacks do |t|
      t.integer :action_id
      t.integer :feedback_id

      t.timestamps
    end
  end
end
