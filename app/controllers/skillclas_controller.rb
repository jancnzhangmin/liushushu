class SkillclasController < ApplicationController
  before_action :set_skillcla, only: [:show, :edit, :update, :destroy]

  def index
    @skillclas = Skillcla.page(params[:page]).per(15)
    if params[:searchkey]
      @skillclas = Skillcla.where('name like ?',"%#{URI::decode(params[:searchkey])}%").page(params[:page]).per(15)
    end
  end

  def show
  end

  def new
    @skillcla = Skillcla.new
  end

  def edit
  end

  def create
    @skillcla = Skillcla.new(skillcla_params)
    respond_to do |format|
      if @skillcla.save
        format.html { redirect_to skillclas_path, notice: 'Skillcla was successfully created.' }
        format.json { render :show, status: :created, location: @skillcla }
      else
        format.html { render :new }
        format.json { render json: @skillcla.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @skillcla.update(skillcla_params)
        format.html { redirect_to skillclas_path, notice: 'Skillcla was successfully updated.' }
        format.json { render :show, status: :ok, location: @skillcla }
      else
        format.html { render :edit }
        format.json { render json: @skillcla.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @skillcla.destroy
    respond_to do |format|
      format.html { redirect_to skillclas_path, notice: 'Skillcla was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_skillcla
    @skillcla = Skillcla.find(params[:id])
  end

  def skillcla_params
    params.require(:skillcla).permit(:name, :keyword)
  end
end
