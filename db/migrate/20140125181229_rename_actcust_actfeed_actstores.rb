class RenameActcustActfeedActstores < ActiveRecord::Migration
  def change
  	rename_table :actcustomers, :promocustomers
  	rename_table :actfeedbacks, :promofeedbacks
  	rename_table :actstores, :promostores
  end
end
