class CreateHelpDesks < ActiveRecord::Migration
  def change
    create_table :help_desks do |t|
      t.string :message
      t.boolean :callback
      t.integer :user_id

      t.timestamps
    end
  end
end
