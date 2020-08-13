# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'bcrypt'

evaluatetagdef = Evaluatetagdef.find_by_keyword('ability')
if evaluatetagdef
  puts "\033[36m专业技能定义存在，本次忽略\033[0m\n"
else
  Evaluatetagdef.create(name:'专业技能', keyword:'ability')
  puts "\033[32m专业技能定义初始化完成\033[0m\n"
end
evaluatetagdef = Evaluatetagdef.find_by_keyword('speed')
if evaluatetagdef
  puts "\033[36m速度定义存在，本次忽略\033[0m\n"
else
  Evaluatetagdef.create(name:'速度', keyword:'speed')
  puts "\033[32m速度定义初始化完成\033[0m\n"
end
evaluatetagdef = Evaluatetagdef.find_by_keyword('attitude')
if evaluatetagdef
  puts "\033[36m服务态度定义存在，本次忽略\033[0m\n"
else
  Evaluatetagdef.create(name:'服务态度', keyword:'attitude')
  puts "\033[32m服务态度定义初始化完成\033[0m\n"
end

skillcla = Skillcla.find_by_keyword('install')
if skillcla
  puts "\033[36m安装分类已存在，本次忽略\033[0m\n"
else
  Skillcla.create(name:'安装', keyword:'install')
  puts "\033[32m安装分类初始化完成\033[0m\n"
end
skillcla = Skillcla.find_by_keyword('lock')
if skillcla
  puts "\033[36m开锁分类已存在，本次忽略\033[0m\n"
else
  Skillcla.create(name:'开锁', keyword:'lock')
  puts "\033[32m开锁分类初始化完成\033[0m\n"
end
skillcla = Skillcla.find_by_keyword('paint')
if skillcla
  puts "\033[36m补漆分类已存在，本次忽略\033[0m\n"
else
  Skillcla.create(name:'补漆', keyword:'paint')
  puts "\033[32m补漆分类初始化完成\033[0m\n"
end
skillcla = Skillcla.find_by_keyword('repair')
if skillcla
  puts "\033[36m维修分类已存在，本次忽略\033[0m\n"
else
  Skillcla.create(name:'维修', keyword:'repair')
  puts "\033[32m维修分类初始化完成\033[0m\n"
end

config = Config.first
if config
  puts "\033[36m配置数据已存在，本次忽略\033[0m\n"
else
  Config.create(appid:'000000000', appsecret:'000000000')
  puts "\033[32m配置数据初始化完成\033[0m\n"
end

admin = Admin.find_by_username('admin')
if admin
  puts "\033[36m后台管理员存在，本次忽略\033[0m\n"
else
  password = BCrypt::Password.create("admin")
  Admin.create(nikname:'后台管理员', username:'admin',password:password)
  puts "\033[32m后台管理员初始化完成\033[0m\n"
end