class RenameColumnToActions < ActiveRecord::Migration
  def change
  	rename_column :actions, :start, :start_date
  	rename_column :actions, :finish, :finish_date 
  end
end
