class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :token
      t.integer :user_id
    end

    add_index :devices, :user_id
  end
end
