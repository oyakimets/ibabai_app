class ChangeNameToActions < ActiveRecord::Migration
  def change
  	rename_table :actions, :promos
  end
end
