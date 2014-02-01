class AddContToPromoact < ActiveRecord::Migration
  def change
    add_column :promoacts, :cont_tag, :string
    add_column :promoacts, :cont_pres, :string
    add_column :promoacts, :cont_desc, :string
  end
end
