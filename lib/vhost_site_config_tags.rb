module VhostSiteConfigTags
  include Radiant::Taggable
  
  class TagError < StandardError; end
 
  desc %{
    Renders the organization name of the current site.
  }
  tag 'site_organization_name' do |tag|
    raise TagError.new("Couldn't find site") if Site.current_site.nil?
    Site.current_site.organization_name
  end

  desc %{
    Renders the description of the current site.
  }
  tag 'site_description' do |tag|
    raise TagError.new("Couldn't find site") if Site.current_site.nil?
    Site.current_site.description
  end

  desc %{
    Renders the keywords of the current site.
  }
  tag 'site_keywords' do |tag|
    raise TagError.new("Couldn't find site") if Site.current_site.nil?
    Site.current_site.keywords
  end

  desc %{
    Renders the google analytics code for the current site.
  }
  tag 'site_google_analytics' do |tag|
    raise TagError.new("Couldn't find site") if Site.current_site.nil?
    id = Site.current_site.google_analytics_id
    return "" if id.nil? || id.empty?

    result = []
    result << '<script type="text/javascript">'
    result << 'var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");'
    result << 'document.write(unescape("%3Cscript src=\'" + gaJsHost + "google-analytics.com/ga.js\' type=\'text/javascript\'%3E%3C/script%3E"));'
    result << '</script>'
    result << '<script type="text/javascript">'
    result << 'try {'
    result << 'var pageTracker = _gat._getTracker("'+id+'");'
    result << 'pageTracker._trackPageview();'
    result << '} catch(err) {}</script>'
    result.join("\n")
  end

end





