class RenameActcatsActsegments < ActiveRecord::Migration
  def change
  	rename_table :actcats, :promocats
  	rename_table :actsegments, :promosegments
  end
end
