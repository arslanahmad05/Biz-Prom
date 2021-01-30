class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show edit update destroy]

  def create
    @like = Like.create(post_id: params[:id], user_id: current_user.id)
    redirect_to root_path
  end
end
