class AddDefaultToSegments < ActiveRecord::Migration
  def change
  	change_column :segments, :age_min, :integer, default: 15
  	change_column :segments, :age_max, :integer, default: 61
  end
end
