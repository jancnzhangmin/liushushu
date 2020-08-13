class OffermsgJob < ApplicationJob
  queue_as :default

  def perform(offerid)
    offer = Offer.find(offerid)
    task = offer.task
    data = {
        "first": {
        "value": '您收到一个新的订单报价信息',
        "color":"#2171ba"
    },
        "keyword1": {
        "value": task.tasknumber.to_s
    },
        "keyword2":{
        "value":task.created_at.strftime('%Y-%m-%d %H:%M:%S')
    },
        "keyword3": {
        "value": offer.user.name.to_s
    },
        "keyword4": {
        "value": "￥:" + ("%0.2f" % offer.price)
    },
        "remark": {
        "value": offer.summary
    }
    }
    res = $client.send_template_msg(task.user.openid, 'z29XOOwFIPPpOrCqA3iRKge8gUIcqNLB4ErRmo1IlLk', 'http://liushushufront.ysdsoft.com', '#2171ba', data)
    if res.code == 40001
      $client = WeixinAuthorize::Client.new(Config.first.appid, Config.first.appsecret)
      $client.send_template_msg(task.user.openid, 'z29XOOwFIPPpOrCqA3iRKge8gUIcqNLB4ErRmo1IlLk', 'http://liushushufront.ysdsoft.com', '#2171ba', data)
    end
  end
end
