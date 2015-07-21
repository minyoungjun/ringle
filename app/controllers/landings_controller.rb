class LandingsController < ApplicationController


  before_filter :detect_korea

  def index

    @main = true

  end
end
