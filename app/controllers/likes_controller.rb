class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show edit update destroy]

  def create
    @like = Like.create(post_id: params[:id], user_id: current_user.id)
    redirect_to root_path
  end

  def destory
    @like = Like.find(params[:id])
    if @like.destroy
      flash[:notice] = 'unlike post'
    else
      flash[:alert] = @like.errors
    end
  end
end
