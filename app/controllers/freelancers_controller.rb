class FreelancersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @freelancers = Freelancer.all.sort_by(&:created_at).reverse
  end
end
