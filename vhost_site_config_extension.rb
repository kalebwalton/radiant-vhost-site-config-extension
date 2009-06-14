# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class VhostSiteConfigExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/vhost_site_config"
  
  define_routes do |map|
    map.namespace :admin do |admin|
      admin.resource :site_configuration, :controller => 'site_configuration'
    end
  end
  
  def activate
    Page.send :include, VhostSiteConfigTags
    admin.tabs.add "Configuration", "/admin/site_configuration", :before => "Help", :visibility => [:admin, :site_admin]
  end
  
  def deactivate
    admin.tabs.remove "Configuration"
  end
  
end
