class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @freelancers = User.all

    @listed = @freelancers.where.not(latitude: nil, longitude: nil)

    @list = Gmaps4rails.build_markers(@listed) do |freelancer, marker|
      marker.lat freelancer.latitude
      marker.lng freelancer.longitude
    end
  end
end
