class RealnamewxmsgJob < ApplicationJob
  queue_as :default

  def perform(realnameid)
    realname = Realname.find(realnameid)
    keyword1 = '审核通过'
    keyword1 = '审核失败' if realname.status == -1
    keyword2 = '审核通过'
    keyword2 = realname.msg if realname.status == -1
    data = {
        "first": {
        "value": '您好，您的审核结果为',
        "color":"#2171ba"
    },
        "keyword1": {
        "value": keyword1
    },
        "keyword2":{
        "value": keyword2
    },
        "remark": {
        "value": ''
    }
    }
    if realname.status.to_i != 0
      res = $client.send_template_msg(realname.user.openid, 'HFIK6MWLEonta-khkLE-kWpJJwwUo1an5Avc0KxUFEw', 'https://liushushufront.ysdsoft.com', '#2171ba', data)
      if res.code == 40001
        $client = WeixinAuthorize::Client.new(Config.first.appid, Config.first.appsecret)
        $client.send_template_msg(realname.user.openid, 'HFIK6MWLEonta-khkLE-kWpJJwwUo1an5Avc0KxUFEw', 'https://liushushufront.ysdsoft.com', '#2171ba', data)
      end
    end
  end
end
