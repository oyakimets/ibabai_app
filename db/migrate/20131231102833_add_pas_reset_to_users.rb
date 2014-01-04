class AddPasResetToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pas_reset_token, :string
    add_column :users, :pas_reset_sent_at, :datetime
  end
end
