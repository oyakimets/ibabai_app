class AddDroppedToSegments < ActiveRecord::Migration
  def change
    add_column :segments, :dropped, :boolean
  end
end
