class PaymentsController < ApplicationController
require 'open-uri'
  def paytest

    user_agent = UserAgent.parse(request.user_agent)
    page_string = user_agent.to_s

 #   render :text => page_string
  end

  def purchase
    pur = Purchase.new
    pur.name = params[:name]
    pur.email = params[:email]
    pur.phone = params[:phone]
    pur.post_code = params[:post_code]
    pur.address = params[:address]
    pur.plan = params[:plan].to_i
    pur.method = params[:method].to_i
    if params[:plan].to_i == 0
      pur.amount = 200000
    else
      pur.amount = 400000
    end
    pur.save

    @purchase = pur

  end

end
