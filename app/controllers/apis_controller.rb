class ApisController < ApplicationController
  skip_before_action :verify_authenticity_token
  def get_skills
    skillcla_arr = []
    Skillcla.all.each do |skillcla|
      param = {
          id: skillcla.id,
          name: skillcla.name,
          updated_at: skillcla.updated_at
      }
      skillcla_arr.push param
    end
    skill_arr = []
    Skill.all.each do |skill|
      param = {
          id: skill.id,
          skillcla_id: skill.skillcla_id,
          name: skill.name,
          img: skill.skillimg.url,
          updated_at: skill.updated_at
      }
      skill_arr.push param
    end
    params = {
        skillclas: skillcla_arr,
        skills: skill_arr
    }
    return_res(params)
  end

  private

  def return_res(result, status = 200, msg = 'OK')
    sign = Digest::SHA1.hexdigest(signature(result).map{|n|n}.join(','))
    param = {
        status: status,
        msg: msg,
        sign: sign,
        result: result
    }
    render json: param.to_json,content_type: "application/javascript"
  end

  def signature(data)
    if data.class != Hash || data.class != Array
      data = JSON.parse(data.to_json)
    end
    calculate_updated_at(data,[])
  end

  def  calculate_updated_at(data, signarr)
    data.class == Hash || data.class == Array ? temdata = data.map{|n|n} : temdata = nil
    if temdata.class == Array
      temdata.each do |t|
        calculate_updated_at(t,signarr)
      end
      if temdata[0] == :updated_at || temdata[0] == 'updated_at'
        signarr.push temdata[1]
      end
    end
    signarr
  end

end
