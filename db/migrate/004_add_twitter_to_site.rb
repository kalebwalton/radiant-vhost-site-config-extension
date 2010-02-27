class AddTwitterToSite < ActiveRecord::Migration
  def self.up
    add_column :sites, :twitter_username, :string
    add_column :sites, :twitter_password, :string
  end

  def self.down
    remove_column :sites, :twitter_username rescue nil
    remove_column :sites, :twitter_password rescue nil
  end
end
