class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js

  def index
    @comments = Comment.all
    respond_with(@comments)
  end

  def show
    respond_with(@comment)
  end

  def new
    @comment = Comment.new
    respond_with(@comment)
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @post = @comment.post
    @comment.user = current_user
    add_device_inf_comment(device_inf_comment_params[:browser], device_inf_comment_params[:os])
    @comment.save
    respond_with(@comment.post)
  end

  def update
    @comment.update(comment_params)
    respond_with(@comment)
  end

  def destroy
    @comment.destroy
    respond_with(@comment)
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :user_id, :post_id)
    end

    def device_inf_comment_params
      params.require(:device_inf).permit(:browser, :os)
    end

    def add_device_inf_comment(browser_name, os_name)
      @comment.device_inf = DeviceInf.new(browser: browser_name, os:os_name)
    end
end
