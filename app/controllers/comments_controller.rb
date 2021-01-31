class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "comment add successfully"
      respond_to do |format|
        format.js { render partial: 'comments/create' }
      end
    else
      flash[:alert] = @comment.errors
      redirect_to root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
