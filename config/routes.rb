Rails.application.routes.draw do
  root 'dashboards#index'
  resources :mytests
  resources :skillclas
  resources :evaluatetagdefs
  resources :skills
  resources :logins
  resources :admins
  resources :apis do
    collection do
      get 'get_skills' #获取技能列表
      get 'get_skillcla_users' #获取技能用户
      get 'get_city' #获取城市列表
      get 'get_userinfo' #获用户信息
      get 'get_vcode' #获取验证码
      post 'set_idcard' #上传身份证
      post 'becomeartison' #上传实名信息
      get 'get_user_skill' #获取技工技能
      post 'set_user_skill' #设置技工技能
      post 'change_service_city' #改变服务城市
      post 'upload_describeimg' #上传技工描述图片
      post 'set_describe' #保存技工描述
      get 'get_describe' #获取技工描述
      get 'get_skill_name' #获取技工名称
      post 'pub_task' #发布订单
      get 'receive_order_list' #我要接单列表
      get 'receive_order_detail' #我要接单明细
      get 'get_artisandetail' #获取技工明细
      post 'order_offer' #技工报价
      get 'get_artisan_list_by_skill' #获取技工分类列表
      get 'mytask_orderlist' #获取我的任务预报价列表
      get 'mytask_orderdetail' #获取我的任务预报价明细
      post 'set_progress_commit' #上传进度内容
      post 'set_progressimg' #上传进度图片
      get 'mytask_progress_list' #获取我的任务进行中列表
      get 'mytask_progress_detail' #获取我的任务进行中明细
      post 'submit_begin' #提交开始
      post 'submit_accept' #提交验收
      get 'myorder_list' #我的订单选择技工列表
      get 'myorder_orderdetail' #我的订单选择技工明细
      post 'choiceartisan' #选择技工
      get 'myorder_progress_list' #获取我的订单进行中列表
      get 'get_becomeartison' #获取技工实名信息
      post 'change_task_status_start' #修改订单状态
      post 'task_accept' #验收
      post 'set_location' #接收经纬度
      post 'set_user_lnglat' #接收用户经纬度
    end
  end
  resources :citycodes
  resources :configs
  resources :realnames
  resources :tasks
  resources :getopenids
  resources :dashboards
  resources :users
  resources :productclas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
