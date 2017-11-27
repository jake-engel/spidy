class ProfilesController < ApplicationController
  before_action :set_profile
  skip_before_action :authenticate_user!, only: [ :show ]

  def show
    if @profile.facebook_picture_url.nil?
      @profile_picture = @profile.photo
    else
      url_temp = @profile.facebook_picture_url[0..-7]
      @profile_picture = "#{url_temp}large"
    end
  end

  def edit
  end

  def update
    @profile.update(profile_params)
    if @profile.update(restaurant_params)
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = User.find(params[:id])
    authorize @profile
  end

  def profile_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :email, :location, :encryped_password)
  end
end
