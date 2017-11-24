class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @location = params[:city ] || "Amsterdam"
    @coordinates = Geocoder.search(@location)[0].data["geometry"]["location"]
    @lat = @coordinates["lat"]
    @lng = @coordinates["lng"]

    @freelancers = Freelancer.all
    # near(@location, 50)

    @list = Gmaps4rails.build_markers(@freelancers) do |worker, marker|
      if worker.user.facebook_picture_url.nil?
        profile_picture = "http://www.vritansh.com/wp-content/uploads/2017/10/placeholder-avatar.png"
      else
        profile_picture = worker.user.facebook_picture_url
      end

      star_rating = helpers.render_stars(worker.avg_rating)

      user_path = view_context.link_to worker.user.first_name, profile_path(worker.user)
      marker.lat worker.user.latitude
      marker.lng worker.user.longitude
      marker.infowindow "<div id=\"test\" style=\"width:145px; min-height:160px; background-color:$light-grey;\">
      <h5><b>#{user_path}</b></h5>
        <a href=#{profile_path(worker.user)}><img class=\"avatar\" src=\"#{profile_picture}\"></a>
        <span class=\"line-wide\" style=\"border-bottom: 1px solid lightgray;width: 100%;display: block; border-width: 1px; margin:5px 0px;\"></span>
        <h4><b>#{worker.position}</b></h4>
        <h4>Rate: #{worker.hourly_pay}#{worker.currency}</h4>
        #{star_rating}
      </div>"
    end
  end
end
