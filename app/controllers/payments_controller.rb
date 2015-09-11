class PaymentsController < ApplicationController
require 'open-uri'
  def paytest

    user_agent = UserAgent.parse(request.user_agent)
    page_string = user_agent.to_s

 #   render :text => page_string
  end

  def promotion
    @amount = params[:id].to_i

    @promotion = true
  end

  def customized
    @amount = params[:number].to_i

  end

  def apply_trial_class


    name = params[:name]
    phone = params[:phone]
    email = params[:email]
    request = params[:request]




    RestClient.post "https://api:key-43a3cc016e86a279ee0ac72636c6f671"\
    "@api.mailgun.net/v3/ringleplus.com/messages",
    :from => "Ringle <admin@ringleplus.com>",
    :to => [ 'jiyeon@ringleplus.com', 'seunghoon@ringleplus.com','mymy@ringleplus.com'], 
    :subject => "어드민에게 감",  
    :html => "이름:" + name + "// 전화:" +  phone + "// 이메일:" + email + "//요청" + request

    redirect_to :back 


     




  end




  def purchase
    pur = Purchase.new
    pur.name = params[:name]
    pur.email = params[:email]
    pur.phone = params[:phone]
    if params[:post_code] != ""
      pur.post_code = params[:post_code]
    else
      pur.post_code = "000-000"
    end

    if params[:address] != ""
      pur.address = params[:address]
    else
      pur.address = "입력을 하지 않으셨습니다"
    end

    pur.plan = params[:plan].to_i
    pur.method = params[:method].to_i

    if params[:plan].to_i == 0
      pur.amount = 200000
    elsif params[:plan].to_i == 1
      pur.amount = 400000
    elsif params[:plan].to_i == 2
      pur.amount = (params[:customize].to_i)*50000
    else
pur.amount = (params[:customize].to_i)*25000
    end

    pur.save

    @purchase = pur

  end

end
