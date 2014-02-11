class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.integer :feedback_id
      t.integer :feedback_val
      t.integer :promoact_id
      t.integer :brand_id
      t.integer :prodcat_id

      t.timestamps
    end
  end
end
