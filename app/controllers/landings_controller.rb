class LandingsController < ApplicationController


  before_filter :detect_korea
  require 'geoip'

  def index

    @main = true
    @cases = [["Coffee", "coffee.jpg"], ["Drone", "drone.jpg"],["Elon Musk","elon.jpg"],["Google vs Amazon", "googlevsamazon.png"],["House of Cards","house.jpg"], ["Icecream", "icecream.jpg"], ["MLB", "mlb.png"],["Shale Gas", "shale.jpg"],["Netflix", "netflix.jpg"],["Smartphone","smartphone.jpg"],["Social Enterprises", "social.png"]]

  end
  def tutor

    @main = true
    @cases = [["Coffee", "coffee.jpg"], ["Drone", "drone.jpg"],["Elon Musk","elon.jpg"],["Google vs Amazon", "googlevsamazon.png"],["House of Cards","house.jpg"], ["Icecream", "icecream.jpg"], ["MLB", "mlb.png"],["Shale Gas", "shale.jpg"],["Netflix", "netflix.jpg"],["Smartphone","smartphone.jpg"],["Social Enterprises", "social.png"]]

  end
end
