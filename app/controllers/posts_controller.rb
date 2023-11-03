class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    if user_signed_in?
      @post = Post.new(user_params)

      if @post.save
        redirect_to new_user_path
      else
        render :new, status: :unprocessable_entity
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @posts = Post.all
    @post = Post.new
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:title, :body)
  end
end
