class RealnamesController < ApplicationController

  before_action :set_realname, only: [:show, :edit, :update, :destroy]

  def index
    @realnames = Realname.page(params[:page]).per(15)
  end

  def show
  end

  def new
    @realname = Realname.new
  end

  def edit
  end

  def create
    @realname = Realname.new(realname_params)
    respond_to do |format|
      if @realname.save
        format.html { redirect_to realnames_path, notice: 'Realname was successfully created.' }
        format.json { render :show, status: :created, location: @realname }
      else
        format.html { render :new }
        format.json { render json: @realname.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @realname.update(realname_params)
        if @realname.status == 1
          user = @realname.user
          user.name = @realname.name
          user.phone = @realname.phone
          user.isartisan = 1
          user.save
        end
        format.html { redirect_to realnames_path, notice: 'Realname was successfully updated.' }
        format.json { render :show, status: :ok, location: @realname }
      else
        format.html { render :edit }
        format.json { render json: @realname.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @realname.destroy
    respond_to do |format|
      format.html { redirect_to realnames_path, notice: 'Realname was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_realname
    @realname = Realname.find(params[:id])
  end

  def realname_params
    params.require(:realname).permit(:name, :phone, :status, :idfront, :idback, :msg)
  end

end
