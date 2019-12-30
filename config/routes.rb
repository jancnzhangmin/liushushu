Rails.application.routes.draw do
  resources :mytests
  resources :skillclas
  resources :evaluatetagdefs
  resources :skills
  resources :apis do
    collection do
      get 'get_skills' #获取技能列表
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
