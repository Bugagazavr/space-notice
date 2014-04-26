class CreateProxyUrls < ActiveRecord::Migration
  def change
    create_table :proxy_urls do |t|
      t.string :code
      t.string :url
    end

    add_index :proxy_urls, :code, :unique => true
  end
end
