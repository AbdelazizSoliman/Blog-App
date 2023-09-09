class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.includes(:posts).order(id: :asc)
  end

  def show
    @user = User.find(params[:id])
    @three_recent_posts = @user.three_most_recent_posts
    @posts = @user.posts.includes(:author)
  end
end
