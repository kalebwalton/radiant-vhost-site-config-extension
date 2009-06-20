class AddColumnsToSite < ActiveRecord::Migration
  def self.up
    add_column :sites, :organization_name, :string
    add_column :sites, :google_maps_key, :string
  end

  def self.down
    remove_column :sites, :organization_name rescue nil
    remove_column :sites, :google_maps_key rescue nil
  end
end
