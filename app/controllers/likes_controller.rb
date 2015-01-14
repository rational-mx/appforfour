class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js

  def index
    @likes = Like.all
    respond_with(@likes)
  end

  def show
    respond_with(@like)
  end

  def new
    @like = Like.new
    respond_with(@like)
  end

  def edit
  end

  def create
    @like = Like.new(like_params)
    @post = @like.post
    @like.save
    respond_with(@like.post)
  end

  def update
    @like.update(like_params)
    respond_with(@like)
  end

  def destroy
    @post = @like.post
    @like.destroy
    @like = @post.likes.new
    @like.user = current_user
    respond_with(@like)
  end

  private
    def set_like
      @like = Like.find(params[:id])
    end

    def set_post
      @post = @like.post
    end

    def like_params
      params.require(:like).permit(:user_id, :post_id)
    end
end
