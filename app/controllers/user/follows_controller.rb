class User::FollowsController < ApplicationController
  before_action :authenticate_user!

  def follower
    @users = current_user.all_follows
  end

  def follow
    @users = current_user.all_following
  end

end
