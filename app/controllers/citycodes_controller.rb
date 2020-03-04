class CitycodesController < ApplicationController
  def index
    @citycodes = Citycode.order('id desc').page(params[:page]).per(15)
    @citycodes = Citycode.where('name like ?',"%#{URI::decode(params[:searchkey])}%").order('id desc').page(params[:page]).per(15) if params[:searchkey]
    @citycount = @citycodes.size
    @citycount = Citycode.all.size if !params[:searchkey]
  end

  def new
    citycodes = Citycode.all
    citycodes.destroy_all
    uri = URI("https://restapi.amap.com/v3/config/district?keywords=100000&subdistrict=2&key=be0feac402c46b1a63da146226a31a15")
    response = Net::HTTP.get(uri)
    set_city(JSON.parse(response)["districts"])
    redirect_to citycodes_path
  end

  private

  def set_city(districts)
    districts.each do |district|
      if district["level"] == 'city'
        pinyin = PinYin.abbr(district["name"])
        fullpinyin = PinYin.of_string(district["name"]).join
        Citycode.create(citycode:district["citycode"], adcode: district["adcode"], name: district["name"], lng: district["center"].split(',')[0], lat: district["center"].split(',')[1], pinyin:pinyin, fullpinyin:fullpinyin)
      end
      if district["districts"] && district["districts"].size > 0
        set_city(district["districts"])
      end
    end
  end

end
