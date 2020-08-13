class AdminsController < ApplicationController
    before_action :set_admin, only: [:show, :edit, :update, :destroy]

  def index
    @admins = Admin.page(params[:page]).per(15)
    if params[:searchkey]
      @admins = Admin.where('nikname like ?',"%#{URI::decode(params[:searchkey])}%").page(params[:page]).per(15)
    end
  end

  def show
  end

  def new
    @admin = Admin.new
  end

  def edit
    @admin.password = ''
  end

  def create
    @admin = Admin.new(admin_params)
    if(params["admin"]["password"] != nil && params["admin"]["password"] != '')
        pwd = BCrypt::Password.create(params["admin"]["password"])
        @admin.password = pwd
    end
    respond_to do |format|
      if @admin.save
        format.html { redirect_to admins_path, notice: 'Skillcla was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin.update(admin_params)
        if(params["admin"]["password"] != nil && params["admin"]["password"] != '')
          pwd = BCrypt::Password.create(params["admin"]["password"])
          @admin.password = pwd
          @admin.save
        end
        format.html { redirect_to admins_path, notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if(@admin.username == "admin")
        format.html { redirect_to admins_path, notice: 'Admin was not successfully destroyed.' }
        format.json { head :no_content }
    end
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_path, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:nikname, :username)
  end
end
