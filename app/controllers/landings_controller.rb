class LandingsController < ApplicationController


  before_filter :detect_korea
  require 'geoip'

  def index

    @main = true

  end
end
