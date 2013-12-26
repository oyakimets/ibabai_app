class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :company, :string
    add_column :users, :tel1, :string
    add_column :users, :tel2, :string
  end
end
