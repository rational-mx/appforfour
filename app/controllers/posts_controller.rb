class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :get_dynamics, only: [:show]

  respond_to :html

  def index
    @posts = Post.all
    respond_with(@posts)
  end

  def show
    respond_with(@post)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    add_post_media(media_post_param[:media_url])
    add_post_device_inf(device_inf_post_param[:browser], device_inf_post_param[:os])
    @post.user = current_user
    @post.save
    respond_with(@post)
  end

  def update
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
    @post.destroy
    respond_with(@post)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:body, :user_id)
    end

    def media_post_param
      params.require(:post).permit(:media_url)
    end

    def device_inf_post_param
      params.require(:device_inf).permit(:browser, :os)
    end

    def add_post_media(media_url)
      @post.medium = Article.new(link_url: media_url)
    end

    def add_post_device_inf(browser_name, os_name)
      @post.device_inf = DeviceInf.new(browser: browser_name, os: os_name)
    end

    def get_dynamics
      real_like = @post.likes.where(user_id: current_user.id)

      if real_like.blank?
        @like = @post.likes.new
        @like.user = current_user
        @already_liked = false
      else
        @like = real_like.first
        @already_liked = true
      end

      @comment = @post.comments.new
      @comment.user = current_user
    end
end
