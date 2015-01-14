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
