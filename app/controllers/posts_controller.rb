class PostsController < ApplicationController
  before_action :require_login

  def new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_index_path
    end
  end

  def index
    @logged_in = session[:logged_in]
    @posts = Post.all
  end

  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to make a post"
      redirect_to sessions_new_path
    end
  end

  def post_params
    params.require(:post).permit(:user_posts, :author, :author_name)
  end
end
