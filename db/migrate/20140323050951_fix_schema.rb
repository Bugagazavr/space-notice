class FixSchema < ActiveRecord::Migration
  def change
    drop_table :notification_types
    add_column :projects, :token, :string
    add_index :projects, :token, unique: true
    
  end
end
