class DeviseInfsController < ApplicationController
  before_action :set_devise_inf, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @devise_infs = DeviseInf.all
    respond_with(@devise_infs)
  end

  def show
    respond_with(@devise_inf)
  end

  def new
    @devise_inf = DeviseInf.new
    respond_with(@devise_inf)
  end

  def edit
  end

  def create
    @devise_inf = DeviseInf.new(devise_inf_params)
    @devise_inf.save
    respond_with(@devise_inf)
  end

  def update
    @devise_inf.update(devise_inf_params)
    respond_with(@devise_inf)
  end

  def destroy
    @devise_inf.destroy
    respond_with(@devise_inf)
  end

  private
    def set_devise_inf
      @devise_inf = DeviseInf.find(params[:id])
    end

    def devise_inf_params
      params.require(:devise_inf).permit(:browser, :os, :post_id, :comment_id)
    end
end
