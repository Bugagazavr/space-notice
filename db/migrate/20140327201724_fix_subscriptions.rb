class FixSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :user_id, :integer
    add_index :subscriptions, :user_id
    add_index :subscriptions, [:user_id, :project_id], unique: true
    remove_column :subscriptions, :device
  end
end
