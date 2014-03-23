class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :device
      t.integer :project_id
    end

    add_index :subscriptions, :project_id
    add_index :subscriptions, [:project_id, :device], unique: true
  end
end
