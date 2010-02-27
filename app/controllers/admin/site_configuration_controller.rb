class Admin::SiteConfigurationController < ApplicationController
  only_allow_access_to :index, :show, :edit, :update,
    :when => [:admin, :site_admin],
    :denied_url => { :controller => 'pages', :action => 'index' },
    :denied_message => 'You must have administrative privileges to perform this action.'

  before_filter :load_site

  def initialize
    @controller_name = 'site'
    @template_name = 'site_configuration'
  end

  def index
    redirect_to :action => 'edit'
  end
  
  def show
    redirect_to :action => 'edit'
  end

  def edit
    render
  end

  def update
    if valid_params?
      if @site.update_attributes(params[:site])
        flash[:notice] = 'Your site configuration has been updated.'
        redirect_to admin_pages_path
      else
        flash[:error] = 'There was an error updating your site configuration.'
        render :action => 'edit'
      end
    else
      announce_bad_data
      render :action => 'edit'
    end
  end

  private

  def load_site
    @site = current_site
  end

  def valid_params?
    hash = (params[:site] || {}).symbolize_keys
    (hash.keys - [:organization_name, :google_maps_key, :google_analytics_id, :twitter_username, :twitter_password, :description, :keywords]).size == 0
  end

  def announce_bad_data
    flash[:error] = 'The data you submitted is invalid.'
  end
end
