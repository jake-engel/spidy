class OffersController < ApplicationController
  def new
    @offer = Offer.new
    @offer.user = current_user
    @offer.freelancer = Freelancer.find(params[:freelancer_id])
    authorize @offer
  end

  def create
    @freelancer = Freelancer.find(params[:freelancer_id])
    @user = current_user
    @offer = Offer.new(offer_params)
    @offer.freelancer = @freelancer
    @offer.user = @user
    authorize @offer
    if @offer.save
      redirect_to freelancers_path
    else
      render :new
    end
  end

  def update
  end

  private

  def offer_params
    params.require(:offer).permit(:price, :price_unit, :budget, :description)
  end
end
