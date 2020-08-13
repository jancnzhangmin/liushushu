class GetopenidsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    $client ||= WeixinAuthorize::Client.new('wxb3d1ca1df413ce9d', 'c4a1d6d2a1b5af73a6666e1308e61595')
    res = $client.get_oauth_access_token('code')
  end

  def create
    $client ||= WeixinAuthorize::Client.new(Config.first.appid, Config.first.appsecret)
    res = $client.get_oauth_access_token(params[:code])
    if res.code == 40001
      $client = WeixinAuthorize::Client.new(Config.first.appid, Config.first.appsecret)
      res = $client.get_oauth_access_token(params[:code])
    end
    openid = res.result["openid"]
    user = User.find_by_openid(openid)
    if !user
      user = User.create(openid:openid, realnamestatus:0, isartisan:0, rateaverage:0, servicecount:0)
    end
    user_info = $client.user(openid)
    user.nickname = user_info.result["nickname"]
    user.headurl = user_info.result["headimgurl"]
    user.save
    sign = Digest::SHA1.hexdigest(Time.now.to_s)
    param = {
        status: 200,
        msg: 'OK',
        sign: sign,
        result: {
            token: user.token.to_s,
            isartisan: user.isartisan.to_i
        }
    }
    render json: param.to_json,content_type: "application/javascript"
  end
end
