class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
    @users = User.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if current_user.id != @post.user_id
      flash[:alert] = "Only the owner can edit this post"
      redirect_to posts_path
    else
      @post.update(post_params)
      redirect_to posts_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post successfully deleted"
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:content, :image)
  end
end
