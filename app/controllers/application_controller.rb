class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :init_share_component

  def after_sign_in_path_for(resource)
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')
    if request.url == sign_in_url
       "/admins/products"
  	else
  		super
    end
  end

  def init_share_component
    @address = Address.last
    @banners = SiteBanner.default
  end
end
