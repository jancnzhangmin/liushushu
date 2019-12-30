class EvaluatetagdefsController < ApplicationController
  before_action :set_evaluatetagdef, only: [:show, :edit, :update, :destroy]

  def index
    @evaluatetagdefs = Evaluatetagdef.page(params[:page]).per(15)
    if params[:searchkey]
      @evaluatetagdefs = Evaluatetagdef.where('name like ?',"%#{URI::decode(params[:searchkey])}%").page(params[:page]).per(15)
    end
  end

  def show
  end

  def new
    @evaluatetagdef = Evaluatetagdef.new
  end

  def edit
  end

  def create
    @evaluatetagdef = Evaluatetagdef.new(evaluatetagdef_params)
    respond_to do |format|
      if @evaluatetagdef.save
        format.html { redirect_to evaluatetagdefs_path, notice: 'Evaluatetagdef was successfully created.' }
        format.json { render :show, status: :created, location: @evaluatetagdef }
      else
        format.html { render :new }
        format.json { render json: @evaluatetagdef.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @evaluatetagdef.update(evaluatetagdef_params)
        format.html { redirect_to evaluatetagdefs_path, notice: 'Evaluatetagdef was successfully updated.' }
        format.json { render :show, status: :ok, location: @evaluatetagdef }
      else
        format.html { render :edit }
        format.json { render json: @evaluatetagdef.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @evaluatetagdef.destroy
    respond_to do |format|
      format.html { redirect_to evaluatetagdefs_path, notice: 'Evaluatetagdef was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_evaluatetagdef
    @evaluatetagdef = Evaluatetagdef.find(params[:id])
  end

  def evaluatetagdef_params
    params.require(:evaluatetagdef).permit(:name)
  end
end
