class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    "/timetables/set_table"
  end

  def detect_korea
    require 'geoip'
    geo = GeoIP.new(Rails.root.join('public', 'GeoIP.dat')).country(request.remote_ip)
    
    if geo.country_code.to_i != 119 && geo.country_code.to_i != 0
      redirect_to "http://tutor.ringleplus.com"
    end
  end
end
