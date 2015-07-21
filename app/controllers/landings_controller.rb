class LandingsController < ApplicationController


  before_filter :detect_korea

  def index

    require 'geoip'
    @main = true
    geo = GeoIP.new(Rails.root.join('public', 'GeoIP.dat')).country(request.remote_ip)
    render :text => geo.inspect

  end
end
