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

  def get_skillcla_users
    user_arr = []
    skillcla = Skillcla.find_by_keyword(params[:keyword])
    users = skillcla.users
    users.each do |user|
      param = {
          id: user.id,
          name: user.name.to_s,
          headurl: user.headurl.to_s,
          phone: user.phone.to_s,
          distance: '',
          star: '',
          ordertotal: '',
          updated_at: user.updated_at
      }
      user_arr.push param
    end
    return_res(user_arr)
  end

  def get_city
    city = Citycode.all.order('id desc')
    az = ('A'..'Z').to_a
    city_params = {}
    az.each do |ch|
      tem_cityarr = []
      city.each do |ci|
        if ci.pinyin[0].upcase == ch
          param = {
              id:ci.id,
              name: ci.name,
              citycode: ci.citycode,
              pinyin: ci.fullpinyin,
              updated_at: ci.updated_at,
              adcode: ci.adcode
          }
          tem_cityarr.push param
        end
      end
      city_params[ch] = tem_cityarr if tem_cityarr.size > 0
    end
    az = city_params.map{|n|n.size > 0 ? n[0] : nil}
    params = {
        cityData: city_params,
        AZ: az
    }
    return_res(params)
  end

  def get_userinfo
    user = User.find_by_token(params[:token])
    param = {
        id:user.id,
        name: user.name..to_s.size > 0 ? user.name.to_s : user.nickname.to_s,
        headurl: user.headurl.to_s,
        servicecity: user.servicearea.city ? user.servicearea.city : '未定义'
    }
    return_res(param)
  end

  def upload_describeimg
    user = User.find_by_token(params[:token])
    describeimgs = user.describeimgs.where('nonce <> ?',params[:nonce])
    describeimgs.destroy_all
    describeimg = user.describeimgs.create(describeimg:params[:img], nonce:params[:nonce])
    render json: '{"type":"img","content":"' + describeimg.describeimg.url + '","uploaded":"ok"}', content_type: "application/javascript"
  end

  def set_describe
    user = User.find_by_token(params[:token])
    describe = user.describe
    describe.destroy if describe
    content = []
    data = JSON.parse(params[:data])
    data.each_key{|t|  content.push(data[t]) }
    user.create_describe(content:content.to_json)
    return_res('')
  end

  def get_describe
    user = User.find_by_token(params[:token])
    describe = user.describe
    param = {
        content: describe.content,
        updated_at: describe.updated_at
    }
    return_res(param)
  end

  def get_vcode
    user = User.find_by_token(params[:token])
    user.vcode = 6.times.map{rand(10).to_s}.join
    user.vcodetime = Time.now
    sendvcode(params[:phone],user.vcode)
    user.save
    return_res('')
  end

  def set_idcard
    user = User.find_by_token(params[:token])
    realname = user.realname
    if !realname
      realname = user.create_realname()
    end
    if params[:idcard] == 'front'
      realname.idfront = params[:data]
    else
      realname.idback = params[:data]
    end
    realname.save
    param = {
        idfronturl: realname.idfront.present? ? realname.idfront.url : '',
        idbackurl: realname.idback.present? ? realname.idback.url : ''
    }
    return_res(param)

  end

  def becomeartison
    user = User.find_by_token(params[:token])
    status = 200
    msg = 'OK'
    if user.vcodetime + 15.minutes < Time.now || params[:vcode] != user.vcode
      status = 201
      msg = '验证码无效'
    else
      realname = user.realname
      realname.name = params[:name]
      realname.phone = params[:phone]
      realname.status = 0
      realname.save
    end
    return_res('',status,msg)
  end

  def get_user_skill
    user = User.find_by_token(params[:token])
    skills = Skill.all
    skillclas = Skillcla.all
    userskills = user.skills
    skill_arr = []
    skillcla_arr = []
    skills.each do |skill|
      skill_param = {
          id: skill.id,
          skillcla_id: skill.skillcla_id,
          name: skill.name,
          isselect: userskills.select{|n|n.id == skill.id}.size > 0 ? 1 : 0,
          updated_at: skill.updated_at
      }
      skill_arr.push skill_param
    end
    skillclas.each do |skillcla|
      skillcla_param = {
          id: skillcla.id,
          name: skillcla.name,
          updated_at: skillcla.updated_at
      }
      skillcla_arr.push skillcla_param
    end
    params = {
        skillclas: skillcla_arr,
        skills: skill_arr
    }
    return_res(params)
  end

  def set_user_skill
    user = User.find_by_token(params[:token])
    user.skills.destroy_all
    skill = Skill.find(params[:id])
    user.skills << skill
    return_res('')
  end

  def change_service_city
    user = User.find_by_token(params[:token])
    servicearea = user.servicearea
    city = Citycode.where('citycode = ? and adcode = ?',params[:citycode],params[:adcode]).first
    servicearea.city = city.name
    servicearea.citycode = city.citycode
    servicearea.adcode = city.adcode
    servicearea.lng = city.lng
    servicearea.lat = city.lat
    servicearea.save
    return_res('')

  end

  def get_skill_name
    skill = Skill.find(params[:id])
    param = {
        id:skill.id,
        name: skill.name
    }
    return_res(param)
  end

  def pub_task
    user = User.find_by_token(params[:token])
    tasknumber = Time.now.strftime('%Y%m%d') + user.id.to_s + Time.now.strftime('%H%M%S')
    user.tasks.create(
        skill_id: params[:data][:skill_id],
        tasknumber: tasknumber,
        choiceartisanstatus: 0,
        beginstatus: 0,
        acceptstatus: 0,
        qualstatus: 0,
        contactphone: params[:data][:contactphone],
        adcode: params[:data][:adcode],
        province: params[:data][:province],
        city: params[:data][:city],
        district: params[:data][:district],
        address: params[:data][:address],
        summary: params[:data][:summary]
    )
    return_res('')
  end

  def receive_order_list
    user = User.find_by_token(params[:token])
    finished = 0
    servicearea = user.servicearea
    tasks = Task.where('choiceartisanstatus = ?', 0)
    tasks = tasks.where('adcode = ?',servicearea.adcode) if user.isartisan == 1 && servicearea
    tasks = tasks.order('id desc').page(params[:page]).per(10)
    finished = 1  if tasks.last_page?
    task_arr = []
    tasks.each do |task|
      address = '****'
      if task.address.size > 6
        address = task.address[0,(task.address.size / 2).to_i] + '****' + task.address[-1,1]
      end
      phone = '****'
      if task.contactphone.size > 3
        phone = task.contactphone.to_s[0,3] + '****' + task.contactphone.to_s[-3,3]
      end
      param = {
          id: task.id,
          tasknumber: task.tasknumber,
          phone: phone,
          servicetype: task.skill.skillcla.name + ' ' + task.skill.name,
          img: task.skill.skillimg.url,
          region: task.province + task.city + task.district,
          address: address,
          publictime: compute_time(task.created_at),
          offer: task.offers.size,
          updated_at: task.updated_at
      }
      task_arr.push param
    end
    params = {
        finished: finished,
        isartisan: user.isartisan,
        data: task_arr
    }
    return_res(params)
  end

  def receive_order_detail
    task = Task.find(params[:id])
    address = '****'
    address = task.address[0,(task.address.size / 2).to_i] + '****' + task.address[-1,1] if task.address.size > 6
    phone = '****'
    phone = task.contactphone[0,3] + '****' + task.contactphone[-3,3] if task.contactphone.size > 6
    param = {
        id: task.id,
        tasknumber: task.tasknumber,
        servicetype: task.skill.skillcla.name + ' ' + task.skill.name,
        region: task.province + task.city + task.district,
        address: address,
        phone: phone,
        publictime: compute_time(task.created_at),
        offer: task.offers.size,
        summary: task.summary,
        updated_at: task.updated_at
    }
    return_res(param)
  end

  def order_offer
    user = User.find_by_token(params[:token])
    task = Task.find(params[:taskid])
    task.offers.create(user_id:user.id, price:params[:price], summary:params[:summary])
    return_res('')
  end

  def get_artisandetail
    user = User.find(params[:id])
    offers = user.offers
    tasks = [0]
    offers.each do |offer|
      tasks.push offer.task.id if offer.task
    end
    tasks = Task.where('id in (?) and acceptstatus = ?',tasks, 1)
    ability_evaluatetagdef = Evaluatetagdef.find_by_keyword('ability')
    ability_evaluatetag = user.evaluatetags.where('evaluatetagdef_id = ?', ability_evaluatetagdef.id)
    speed_evaluatetagdef = Evaluatetagdef.find_by_keyword('speed')
    speed_evaluatetag = user.evaluatetags.where('evaluatetagdef_id = ?', speed_evaluatetagdef.id)
    attitude_evaluatetagdef = Evaluatetagdef.find_by_keyword('attitude')
    attitude_evaluatetag = user.evaluatetags.where('evaluatetagdef_id = ?', attitude_evaluatetagdef.id)

    param = {
        name: user.realname.name,
        phone: user.realname.phone,
        servicecount: tasks.size,
        ability: ability_evaluatetag.size > 0 ? ability_evaluatetag.average('rate') : 4.5,
        speed: speed_evaluatetag.size > 0 ? speed_evaluatetag.average('rate') : 4.5,
        attitude: attitude_evaluatetag.size > 0 ? attitude_evaluatetag.average('rate') : 4.5
    }

    params = {
        artisan: param,
        describe: user.describe.content
    }
    return_res(params)
  end

  def get_artisan_list_by_skill
    skillcla = Skillcla.find_by_keyword(params[:type])
    skills = skillcla.skills
    users = []
    skills.each do |skill|
      users += skill.users.ids
    end
    users.uniq!
    users = User.where('id in (?)', users)
    userarr = []
    users.each do |user|
      offers = user.offers
      tasks = [0]
      offers.each do |offer|
        task = offer.task
        if task.acceptstatus == 1
          tasks += task.id
        end
      end
      tasks.uniq!
      tasks = Task.where('id in (?)',tasks)
      describe = user.describe.content
      ds = JSON.parse(describe).map{|n|n["type"] == "txt" ? n["content"] : ''}.join(' ')
      evaluatetags = user.evaluatetags.where('rate > 0')
      ev = 4.5
      if evaluatetags.size > 0
        ev = evaluatetags.average('rate')
      end
      param = {
          id: user.id,
          name: user.realname.name,
          phone: user.realname.phone,
          star: ev,
          servicecount: tasks.size,
          describe:ds
      }
      userarr.push param
    end
    params = {
        artisan: userarr,
        skillcla: skillcla.name
    }
    return_res(params)
  end

  def mytask_orderlist
    user = User.find_by_token(params[:token])
    offers = user.offers
    taskids = [0]
    taskids += offers.map{|n|n.task_id}
    finished = 0
    tasks = Task.where('id in (?)', taskids).order('id desc').page(params[:page]).per(10)
    finished = 1 if tasks.last_page?
    taskarr = []
    tasks.each do |task|
      skill = task.skill.name
      skillcla = task.skill.skillcla.name
      contactphone = '****'
      contactphone = task.contactphone[0,3] + '****' + task.contactphone[-3,3] if contactphone.size > 6
      address = '****'
      address = task.address[0,(task.address.length / 2).to_i] + '****' + task.address[-1,1] if task.address.size > 2
      param = {
          id: task.id,
          price: ActiveSupport::NumberHelper.number_to_currency(task.offers.first.price,unit:'￥'),
          servicetype: skillcla + ' '+ skill,
          publictime: compute_time(task.created_at),
          region: task.province + task.city + task.district,
          contactphone: contactphone,
          address: address,
          updated_at: task.updated_at
      }
      taskarr.push param
    end
    params = {
        finished: finished,
        tasks: taskarr
    }
    return_res(params)
  end

  def mytask_orderdetail
    user = User.find_by_token(params[:token])
    task = Task.find(params[:taskid])
    offer = Offer.where('task_id = ? and user_id = ?',task.id, user.id).first
    phone = '****'
    phone = task.contactphone[0,3] + '****' + task.contactphone[-3,3] if task.contactphone.size > 6
    address = '****'
    address = task.address[0,(task.address.size / 2).to_i] + '****' + task.address[-1,1] if task.address.size > 6
    skill = task.skill
    skillcla = skill.skillcla.name + ' ' + skill.name
    task_param = {
        id: task.id,
        phone: phone,
        region: task.province + task.city + task.district,
        address: address,
        skill: skillcla,
        summary: task.summary,
        updated_at: task.updated_at
    }
    offer_param = {
        id: offer.id,
        price: offer.price,
        summary: offer.summary,
        updated_at: offer.updated_at
    }
    params = {
        task: task_param,
        offer: offer_param
    }
    return_res(params)
  end

  def mytask_progress_list
    user = User.find_by_token(params[:token])
    offers = user.offers.where('isselect = 1')
    taskids = [0]
    taskids += offers.map(&:task_id)
    finished = 0
    tasks = Task.where('id in (?) and acceptstatus <> 1',taskids).page(params[:page]).per(10)
    finished = 1 if tasks.last_page? || tasks.out_of_range?
    taskarr = []
    tasks.each do |task|
      skill = task.skill
      skillcla = skill.skillcla
      param = {
          id: task.id,
          offer: ActiveSupport::NumberHelper.number_to_currency(task.offers.first.price,unit:'￥'),
          servicetype: skillcla.name + ' ' + skill.name,
          status: task.beginstatus == 1 ? '进行中' : '未开始',
          phone: task.contactphone,
          region: task.province + task.city + task.district,
          address: task.address
      }
      taskarr.push param
    end
    params = {
        finished: finished,
        data: taskarr
    }
    return_res(params)
  end

  def mytask_progress_detail
    task = Task.find(params[:taskid])
    #progress_status 0未开始 1进行中 2提交验收 3验收完成
    progress_status = 0
    progress_status = 1 if task.beginstatus == 1
    progress_status = 2 if task.submitaccept == 1
    progress_status = 3 if task.acceptstatus == 1
    skill = task.skill
    skillcla = skill.skillcla
    task_param = {
        id: task.id,
        progress_status: progress_status,
        servicetype: skillcla.name + ' ' + skill.name,
        publictime: compute_time(task.created_at),
        phone: task.contactphone,
        region: task.province + task.city + task.district,
        address: task.address,
        summary: task.summary,
        offer: ActiveSupport::NumberHelper.number_to_currency(task.offers.first.price,unit:'￥'),
        updated_at: task.updated_at
    }
    progrearr = []
    progres = task.progres
    progres.each do |progre|
      progreimgs = progre.progreimgs
      progreimgarr = []
      progreimgs.each do |progreimg|
        progreimg_param = {
            id: progreimg.id,
            img: progreimg.progreimg.url,
            updated_at: progreimg.updated_at
        }
        progreimgarr.push progreimg_param
      end
      user = task.offers.where('isselect = 1').first.user
      name = user.realname.name
      commit_param = {
          id: progre.id,
          name: name,
          publictime: compute_time(progre.created_at),
          summary: progre.summary,
          imgs: progreimgarr,
          updated_at: progre.updated_at
      }
      progrearr.push commit_param
    end
    params = {
        task: task_param,
        commitContent: progrearr
    }
    return_res(params)
  end

  def set_progress_commit
    task = Task.find(params[:taskid])
    progre = task.progres.create(summary: params[:summary])
    param = {
        progre_id: progre.id
    }
    return_res(param)
  end

  def set_progressimg
    progre = Progre.find(params[:progreid])
    progre.progreimgs.create(progreimg:params[:img])
    render json: '{"status":"ok"}',content_type: "application/javascript"
  end

  def submit_begin
    task = Task.find(params[:taskid])
    task.beginstatus = 1
    task.begintime = Time.now
    task.save
    return_res('')
  end

  def submit_accept
    task = Task.find(params[:taskid])
    task.submitaccept = 1
    task.submittime = Time.now
    task.save
    return_res('')
  end

  def myorder_list
    user = User.find_by_token(params[:token])
    tasks = user.tasks.where('choiceartisanstatus = 0').page(params[:page]).per(8)
    finished = 0
    finished = 1 if tasks.last_page? || tasks.out_of_range?
    taskarr = []
    tasks.each do |task|
      param = {
          id: task.id,
          publictime: compute_time(task.created_at),
          offer_number: task.offers.size,
          summary: task.summary,
          updated_at: task.updated_at
      }
      taskarr.push param
    end
    params = {
        tasks: taskarr,
        finished: finished
    }
    return_res(params)
  end

  def myorder_orderdetail
    task = Task.find(params[:taskid])
    skill = task.skill
    skillcla = skill.skillcla
    orderdetail_param = {
        id: task.id,
        tasknumber: task.tasknumber,
        skillcla: skillcla.name + ' ' + skill.name,
        phone: task.contactphone,
        region: task.province + task.city + task.district,
        address: task.address,
        summary: task.summary,
        publictime: compute_time(task.created_at),
        updated_at: task.updated_at
    }
    offers = task.offers
    offerarr = []
    offers.each do |offer|
      offer_param = {
          id: offer.id,
          artisanid: offer.user.id,
          name: offer.user.name,
          phone: offer.user.phone.to_s,
          price: ActiveSupport::NumberHelper.number_to_currency(offer.price,unit:'￥'),
          summary: offer.summary,
          rateaverage: offer.user.rateaverage.to_f == 0 ? 4.5 : offer.user.rateaverage.to_f,
          servicecount: offer.user.servicecount.to_i,
          isselect: offer.isselect,
          updated_at: offer.updated_at
      }
      offerarr.push offer_param
    end
    params = {
        task: orderdetail_param,
        offers: offerarr
    }
    return_res(params)
  end

  def choiceartisan
    offer = Offer.find(params[:offerid])
    offer.isselect = 1
    offer.save
    task = offer.task
    task.choiceartisanstatus = 1
    task.choiceartisantime = Time.now
    task.save
    return_res('')
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

  def compute_time(time) #时间换算成分钟前
    res = time.strftime('%Y-%m-%d %H:%M:%S')
    nowtime = (Time.now - time) / 60
    res = '刚刚' if nowtime < 1
    res = nowtime.to_i.to_s + '分钟前' if nowtime >= 1 && nowtime < 60
    res = (nowtime / 60).to_i.to_s + '小时前' if nowtime >= 60 && nowtime < 1440
    res
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
