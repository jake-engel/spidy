class FreelancersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @freelancers = policy_scope(Freelancer).order(created_at: :desc)
  end

  def new
    @freelancer = Freelancer.new
    @freelancer.user = current_user
    authorize @freelancer
  end

  def create
    @freelancer = Freelancer.new(freelancer_params)
    @freelancer.user = current_user
    authorize @freelancer
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
    params.require(:freelancer).permit(:position, :currency, :hourly_pay, :summary,
      skills_attributes: [ :id, :name, :destroy ],
      experiences_attributes: [ :id, :title, :company, :location, :description, :destroy ])
  end
end
