class CreateNotificationTypes < ActiveRecord::Migration
  def change
    create_table :notification_types do |t|
      t.integer :project_id
      t.string :name
      t.string :token
    end

    add_index :notification_types, :project_id
    add_index :notification_types, :token, unique: true
  end
end
