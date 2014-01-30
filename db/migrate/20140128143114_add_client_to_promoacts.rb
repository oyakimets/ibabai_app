class AddClientToPromoacts < ActiveRecord::Migration
  def change
    add_column :promoacts, :client_id, :integer
  end
end
