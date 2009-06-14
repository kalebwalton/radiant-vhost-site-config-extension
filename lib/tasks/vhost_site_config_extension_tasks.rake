namespace :radiant do
  namespace :extensions do
    namespace :vhost_site_config do
      
      desc "Runs the migration of the Vhost Site Config extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          VhostSiteConfigExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          VhostSiteConfigExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Vhost Site Config to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from VhostSiteConfigExtension"
        Dir[VhostSiteConfigExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(VhostSiteConfigExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
