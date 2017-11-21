class FreelancersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @freelancers = Freelancer.all.sort_by(&:created_at).reverse
  end

  def new
    @freelancer = Freelancer.new
    @freelancer.user = current_user
  end

  def create
    @freelancer = Freelancer.new(freelancer_params)
    @freelancer.user = current_user
    if @freelancer.save
      redirect_to profile_path(@user)
    else
      render :new
    end
  end

  private

  def job_contract_params
    params.require(:freelancer).permit()
  end
end
