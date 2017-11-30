class FreelancersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @location = params[:city]
    @location == "" || @location == nil ? @location = "Amsterdam" : @location = params[:city]
    @range = params[:distance] || 10
    coordinates = Geocoder.search(@location)[0].data["geometry"]["location"]
    @lat = coordinates["lat"]
    @lng = coordinates["lng"]

    freetot = []
    free = User.near(@location, @range)

    free.each do |worker|
      freetot << Freelancer.where(user_id: worker.id)[0]
    end

    freetot.compact!
    @mapFreelancers = Freelancer.where(id: freetot.map(&:id))

    filtering_params(params).each do |key, value|
      if value == ""
        @value = "All Jobs"
        @job_placeholder = value
      else
        value = value.split.map(&:capitalize).join(' ')
        @value = value
        @job_placeholder = value
        @mapFreelancers = @mapFreelancers.job_search(value)
      end
    end

    @freelancerCount = @mapFreelancers.size
    if @freelancerCount == 1
      @freelancerWord = "PROFESSIONAL"
    else
      @freelancerWord= "PROFESSIONALS"
    end

    @list = Gmaps4rails.build_markers(@mapFreelancers) do |worker, marker|
      if worker.user.facebook_picture_url.nil?
        profile_picture = worker.user.photo
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

    @freelancers = policy_scope(@mapFreelancers).order(created_at: :desc)
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
      experiences_attributes: [ :id, :title, :company, :location, :description, :destroy, :starting_date, :ending_date, :picture, :photo_cache])
  end

  def filtering_params(params)
    params.slice(:job_title)
  end
end
