class AddIndexToClientsName < ActiveRecord::Migration
  def change
  	add_index :clients, :name, unique: true
  end
end
