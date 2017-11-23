class My::OffersController < ApplicationController
  def index
    @offers = policy_scope(Offer).order(created_at: :desc)
  end

  def destroy
  end
end
