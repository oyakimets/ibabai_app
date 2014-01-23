class AddStatusToActions < ActiveRecord::Migration
  def change
    add_column :actions, :status, :integer
  end
end
