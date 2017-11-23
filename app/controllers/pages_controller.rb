class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @location = params[:city ] || "Amsterdam"
    @coordinates = Geocoder.search(@location)[0].data["geometry"]["location"]
    @lat = @coordinates["lat"]
    @lng = @coordinates["lng"]

    @freelancers = User.all
    # near(@location, 50)

    @list = Gmaps4rails.build_markers(@freelancers) do |freelancer, marker|
      marker.lat freelancer.latitude
      marker.lng freelancer.longitude
    end
  end
end
