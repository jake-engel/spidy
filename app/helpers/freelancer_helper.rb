module FreelancerHelper
  require 'json'

  def status(offer)
    case freelancer.status
    when 0
      "Declined"
    when 1
      "Pending"
    when 2
      "Accepted"
    when 3
      "Completed"
    end
  end

  def render_stars(value)
    output = ''
    floored = value.floor

    floored.times { output << "<i class=\"fa fa-star gold\" aria-hidden=\"true\"></i>" }

    if (value - floored) >= 0.5
      output << "<i class=\"fa fa-star-half-o gold\" aria-hidden=\"true\"></i>"
      value += 1
    end

    (5 - value).round.times { output << "<i class=\"fa fa-star-o gold\" aria-hidden=\"true\"></i>" }
    output.html_safe
  end
end
