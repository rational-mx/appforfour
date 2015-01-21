class DeviceInfsController < ApplicationController
  before_action :set_device_inf, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @device_infs = DeviceInf.all
    respond_with(@device_infs)
  end

  def show
    respond_with(@device_inf)
  end

  def new
    @device_inf = DeviceInf.new
    respond_with(@device_inf)
  end

  def edit
  end

  def create
    @device_inf = DeviceInf.new(device_inf_params)
    @device_inf.save
    respond_with(@device_inf)
  end

  def update
    @device_inf.update(device_inf_params)
    respond_with(@device_inf)
  end

  def destroy
    @device_inf.destroy
    respond_with(@device_inf)
  end

  private
    def set_device_inf
      @device_inf = DeviceInf.find(params[:id])
    end

    def device_inf_params
      params.require(:device_inf).permit(:browser, :os, :post_id, :comment_id)
    end
end
