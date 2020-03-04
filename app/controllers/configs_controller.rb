class ConfigsController < ApplicationController
  def index
    config = Config.first
    redirect_to edit_config_path(config)
  end

  def edit
    @config = Config.find(params[:id])
  end

  def update
    respond_to do |format|
      @config = Config.find(params[:id])
      if @config.update(config_params)
        flash[:success] = "配置更新成功"
        format.html { redirect_to edit_config_path(@config) }
        format.json { render :show, status: :ok, location: @config }
      else
        format.html { render :edit }
        format.json { render json: @config.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def config_params
    params.require(:config).permit(:appid, :appsecret)
  end
end
