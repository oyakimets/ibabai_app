class ChangeNameToActcities < ActiveRecord::Migration
  def change
  	rename_table :actcities, :promocities
  end
end
