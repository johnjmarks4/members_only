class PostsController < ApplicationController
  before_action :require_login

  def new
  end

  def create
    @post = Post.new(author: session[:user_id], user_posts: params[:user_posts])
    if @post.save
      redirect_to posts_index_path
    end
  end

  def index
    @posts = Post.all
  end

  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to make a post"
      redirect_to sessions_new_path
    end
  end
end
