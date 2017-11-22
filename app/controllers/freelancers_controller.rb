class FreelancersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @freelancers = Freelancer.all.sort_by(&:created_at).reverse
  end

  def new
    @freelancer = Freelancer.new
    @freelancer.user = current_user
    @skill = Skill.new
  end

  def create
    @freelancer = Freelancer.new(freelancer_params)
    @freelancer.user = current_user
    if @freelancer.save
      current_user.has_freelancer = true
      current_user.save
      redirect_to profile_path(current_user)
    else
      render :new
    end
  end

  private

  def freelancer_params
    params.require(:freelancer).permit(:position, :currency, :hourly_pay, :summary)
  end
end
