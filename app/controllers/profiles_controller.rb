class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [ :show ]

  def show
    if @profile.has_freelancer
      @freelancer = Freelancer.where(user_id: @profile.id)
      @skills = Skill.where(freelancer_id: @freelancer.ids)
      @experiences = Experience.where(freelancer_id: @freelancer.ids)
    end

    if (@profile.facebook_picture_url) == nil
      @profile_picture_url = "https://developer.appway.com/filesystem/d6912741f1280a6128b983842c487477225fc90a34614d857290b935c8c2e54a736ac48da2a39d13db50853310e7a9807e5611b45cc9e299/avatar.svg"
    else
      url_temp = @profile.facebook_picture_url[0..-7]
      @profile_picture_url = "#{url_temp}large"
    end
  end

  def edit
  end

  def update
    @profile.update(profile_params)
    redirect_to profile_path
  end

  private

  def set_profile
    if user_signed_in? && current_user.id == User.find(params[:id])
      @profile = current_user
    else
      @profile = User.find(params[:id])
    end
  end

  def profile_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :email, :description)
  end


end
