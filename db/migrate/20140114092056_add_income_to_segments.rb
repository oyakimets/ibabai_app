class AddIncomeToSegments < ActiveRecord::Migration
  def change
    add_column :segments, :income, :string
  end
end
