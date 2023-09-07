class PostsController < ApplicationController
  before_action :find_user, only: %i[index show]
  before_action :find_post, only: [:show]

  def index
    @posts = Post.includes(:author)
      .includes(:comments)
      .where(author: params[:user_id])
      .order(created_at: :asc)
  end

  def show
    @post = Post.find(params[:id])
    @current_user = User.first
    @like = Like.new
  end

  def new
    @user = current_user
    @post = @user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = 'Post created successfully.'
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def like
    @post = Post.find(params[:id])
    @user = @post.author # Find the user associated with the post
    @like = @post.likes.new
    @like.author = current_user
    @like.save
    redirect_to user_post_path(@user, @post)
  end

  def unlike
    @post = Post.find(params[:id]) # Find the post
    @user = @post.author # Find the user associated with the post

    @like = @post.likes.find_by(author: current_user) # Find the like by the current user
    # Destroy the like if found
    @like&.destroy

    redirect_to user_post_path(@user, @post)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_post
    @post = @user.posts.find_by(id: params[:id])
    return unless @post.nil?

    flash[:alert] = 'Post not found, back to posts page'
    redirect_to user_posts_path(@user)
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
