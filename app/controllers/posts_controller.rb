class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    if !(current_user.profile.present?)
      redirect_to new_user_profile_path
    else
      @post = Post.new
      @posts = Post.all
    end

  end

end
