class User::ProfilesController < ApplicationController
  before_action :authenticate_user!

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      flash[:notice] = "profile created!"
      redirect_to all_users_path
    else
      flash[:alert] = @profile.errors
      render 'new'
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:user_name, :first_name, :last_name, :address,
                                 :city, :country, :phone, :company_name,
                                 :company_bio, :gender, :avatar)
  end
end
