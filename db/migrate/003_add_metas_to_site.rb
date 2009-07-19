class AddMetasToSite < ActiveRecord::Migration
  def self.up
    add_column :sites, :description, :string
    add_column :sites, :keywords, :string
  end

  def self.down
    remove_column :sites, :description rescue nil
    remove_column :sites, :keywords rescue nil
  end
end
