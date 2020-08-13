class SendwxmsgJob < ApplicationJob
  queue_as :default

  def perform(taskid)
    task = Task.find(taskid)
    #serviceareas = Servicearea.where('adcode like ?',task.adcode[0,4] + '%')
    serviceareas = Servicearea.all
    $client ||= WeixinAuthorize::Client.new(Config.first.appid, Config.first.appsecret)
    serviceareas.each do |servicearea|
      user = servicearea.user
      customerinfo = '****'
      customerinfo = task.address[0,task.address.size / 2] + '****' + task.address[-1,1] if task.address.size > 4
      data = {
          "first": {
              "value": '您有一条新订单',
              "color":"#2171ba"
          },
          "tradeDateTime": {
              "value": task.created_at.strftime('%Y-%m-%d %H:%M:%S')
          },
          "orderType":{
              "value":task.skill.skillcla.name.to_s + " " + task.skill.name.to_s
          },
          "customerInfo": {
              "value": task.city.to_s + task.district.to_s + customerinfo
          },
          "orderItemName":{"value": "服务城市"},
          "orderItemData":{"value":task.city},
          "remark": {
              "value": task.summary.to_s
          }
      }
      if user.isartisan == 1
        res = $client.send_template_msg(user.openid, 'ZP0GkSHfDhCEvlbQYl2t8A3JahxPB7ScyF_ZSzqOJm8', 'https://liushushufront.ysdsoft.com', '#2171ba', data)
        if res.code == 40001
          $client = WeixinAuthorize::Client.new(Config.first.appid, Config.first.appsecret)
          $client.send_template_msg(user.openid, 'ZP0GkSHfDhCEvlbQYl2t8A3JahxPB7ScyF_ZSzqOJm8', 'https://liushushufront.ysdsoft.com', '#2171ba', data)
        end
      end
    end
  end
end
