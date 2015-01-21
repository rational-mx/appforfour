class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy,:scroll]
  before_action :get_dynamics, only: [:show]

  respond_to :html,:js

  def index
    @posts = Post.all
    respond_with(@posts)
  end

  def show
    @number_of_comments = 5
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

  def scroll

    @comments = @post.comments.all.order('id asc').limit(params[:number_of_comments])
    @number_of_comments = params[:number_of_comments]
    @number_of_comments = @number_of_comments.to_i + 5
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

    def number_comments_param
      params.require(:post).permit(:number_of_comments)
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
