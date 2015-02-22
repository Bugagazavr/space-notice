class User < ActiveRecord::Base
  self.table_name = "users"
end

class AddMultipleProviderSupport < ActiveRecord::Migration
  def change
    rename_column :users, :github_id, :provider_user_id
    add_column :users, :provider, :string

    remove_index :users, :provider_user_id
    add_index :users, [:provider_user_id, :provider], unique: true

    User.all.each do |user|
      user.update(provider: 'github')
    end
  end
end
