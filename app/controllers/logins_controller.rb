class LoginsController < ApplicationController
    def index
        Rails.configuration.app_sidebar = false
        Rails.configuration.app_header = false
    end

    def create
        if(params["user"] && params["pwd"])
            user = Admin.find_by_username(params["user"])
            if(user)
                pwd = BCrypt::Password.new(user.password)
                if(pwd == params["pwd"])
                    session['id'] = user.id
                    Rails.configuration.app_sidebar = true
                    Rails.configuration.app_header = true
                    redirect_to dashboards_path
                end
            else
                format.html { redirect_to logins_path, notice: '登陆失败' } 
            end
        else
            format.html { redirect_to logins_path, notice: '登陆失败' } 
        end
    end

    def new
        if(session['id'])
            session['id'] = nil
        end
        redirect_to logins_path
    end
end
