class PaymentsController < ApplicationController
require 'open-uri'
  def paytest

    user_agent = UserAgent.parse(request.user_agent)
    page_string = user_agent.to_s

 #   render :text => page_string

  end
end
