class AddAttrToActions < ActiveRecord::Migration
  def change
    add_column :actions, :user_id, :integer
    add_column :actions, :del_fee, :float, default: 0.25
    add_column :actions, :del_num, :integer
    add_column :actions, :reward_1, :integer
    add_column :actions, :reward_2, :integer
    add_column :actions, :contact_limit, :integer
    add_column :actions, :budget_limit, :integer
  end
end
