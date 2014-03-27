class AddTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :token, :string
    add_index :users, :token, unique: true

    User.all.each { |u| u.send :set_token; u.save! }
  end
end
