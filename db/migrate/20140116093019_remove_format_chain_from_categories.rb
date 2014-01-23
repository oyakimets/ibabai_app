class RemoveFormatChainFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :cat_format, :string
    remove_column :categories, :cat_chain, :string
  end
end
