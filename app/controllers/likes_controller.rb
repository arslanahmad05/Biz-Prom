class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = Like.create(post_id: params[:id], user_id: current_user.id)
    respond_to do |format|
      format.js { render partial: 'likes/create' }
    end
  end

  def destroy
    @like = current_user.likes.find_by(post_id: params[:id]).destroy
    respond_to do |format|
      format.js { render partial: 'likes/destroy' }
    end
  end
end
