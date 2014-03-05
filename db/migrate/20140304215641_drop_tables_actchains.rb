class DropTablesActchains < ActiveRecord::Migration
  def change
  	drop_table :actchains 
  	drop_table :actformats
  end
end
