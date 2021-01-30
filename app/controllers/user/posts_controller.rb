class User::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = current_user.posts
  end

  def show; end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if (@post.save)
      flash[:notice] = 'post create successfully'
      redirect_to user_posts_path
    else
      flash[:alert] = @post.errors
    end
  end

  def edit

  end

  def update
    if(@post.update(post_params))
      flash[:notice] = "Post update successfully"
    else
      flash[:alert] = @post.errors
    end
  end

  def destroy

    if(@post.destroy)
      flash[:notice] = "Post delete successfully!!"
    else
      flash[:alert] = @post.errors
    end

  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, images: [])
  end
end
