class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :github_id
      t.string :username
      t.timestamp :created_at
    end

    add_index :users, :github_id, unique: true
  end
end
