require 'open-uri'

Skill.destroy_all
Experience.destroy_all
Freelancer.destroy_all
User.destroy_all

num_users = 4
repeats = 1
repeats.times.with_index do |index|
  puts "Repeat ##{index + 1}"
  random_person_url_nl = "https://randomuser.me/api/?results=#{num_users}&nat=nl"
  random_person_url_us = "https://randomuser.me/api/?results=#{num_users}&nat=us"
  random_person_url_gb = "https://randomuser.me/api/?results=#{num_users}&nat=gb"
  random_person_url_fr = "https://randomuser.me/api/?results=#{num_users}&nat=fr"

  rand_users_nl = JSON.parse(open(random_person_url_nl).string)["results"]
  rand_users_nl.each_with_index do |rand_user, index|
    User.create(
      first_name: rand_user["name"]["first"].capitalize,
      last_name: rand_user["name"]["last"].capitalize,
      password: 'password',
      email: "#{rand_user["name"]["first"]}.#{rand_user["name"]["last"]}@gmail.com",
      phone_number: "+31#{rand_user["cell"]}",
      location: ["Westerstraat, Amsterdam, Netherlands", "Borssenburgplein, Amsterdam",
        "Jisperveldstraat, Amsterdam", "Argonautenstraat, Amsterdam", "Rochussenstraat, Amsterdam",
        "Van Woustraat, Amsterdam", "Molukkenstraat, Amsterdam", "Dam Square, Amsterdam",
        "Radarweg, Amsterdam", "A-Lab, Amsterdam", "Grachtengordel-West, Amsterdam",
        "Vinkenstraat, Amsterdam", "Nicolaas Maesstraat, Amsterdam", "Binnenstad, Amsterdam",
        "De Wallen, Amsterdam", "Grachtengordel-West, Amsterdam", "Maupoleum, Amsterdam",
        "Burgwallen Nieuwe Zijde, Amsterdam", "Zuiderkirk, Amsterdam", "Beursplein, Amsterdam",
        "Nieuwezijds Voorburgwal, Amsterdam", "Prins Hendrikkade, Amsterdam",
        "Zeedijk, Amsterdam", "The-DM Studios, Amsterdam", "Warmoesstraat, Amsterdam",
        "Barndesteeg, Amsterdam", "Koestraat, Amsterdam", "Nieuwe Uilenburgerstraat, Amsterdam",
        "Czaar Peterbuurt, Amsterdam", "Haarlemmerbuurt, Amsterdam", "Dam 9, Amsterdam"].sample,
      has_freelancer: true,
      photo: rand_user["picture"]["large"]
      )
    puts "Creating NL User ##{index + 1}"
  end

  rand_users_us = JSON.parse(open(random_person_url_us).string)["results"]
  rand_users_us.each_with_index do |rand_user, index|
    User.create(
      first_name: rand_user["name"]["first"].capitalize,
      last_name: rand_user["name"]["last"].capitalize,
      password: 'password',
      email: "#{rand_user["name"]["first"]}.#{rand_user["name"]["last"]}@gmail.com",
      phone_number: "+1#{rand_user["cell"]}",
      location: "#{rand_user["location"]["city"].capitalize}, #{rand_user["location"]["state"].capitalize}",
      has_freelancer: true,
      photo: rand_user["picture"]["large"]
      )
    puts "Creating US User ##{index + 1}"
  end

  rand_users_gb = JSON.parse(open(random_person_url_gb).string)["results"]
  rand_users_gb.each_with_index do |rand_user|
    User.create(
      first_name: rand_user["name"]["first"].capitalize,
      last_name: rand_user["name"]["last"].capitalize,
      password: 'password',
      email: "#{rand_user["name"]["first"]}.#{rand_user["name"]["last"]}@gmail.com",
      phone_number: "+1#{rand_user["cell"]}",
      location: "#{rand_user["location"]["city"].capitalize}, #{rand_user["location"]["state"].capitalize}",
      has_freelancer: true,
      photo: rand_user["picture"]["large"]
      )
    puts "Creating GB User ##{index + 1}"
  end

  rand_users_fr = JSON.parse(open(random_person_url_fr).string)["results"]
  rand_users_fr.each do |rand_user|
    User.create(
      first_name: rand_user["name"]["first"].capitalize,
      last_name: rand_user["name"]["last"].capitalize,
      password: 'password',
      email: "#{rand_user["name"]["first"]}.#{rand_user["name"]["last"]}@gmail.com",
      phone_number: "+1#{rand_user["cell"]}",
      location: "#{rand_user["location"]["city"].capitalize}, #{rand_user["location"]["state"].capitalize}",
      has_freelancer: true,
      photo: rand_user["picture"]["large"]
      )
    puts "Creating FR User ##{index + 1}"
  end
end

users = User.all.sample(num_users * repeats + 30)
iter = 0

(num_users * repeats + 30).times do
  freelancer = Freelancer.new(
    position: ["Painter", "Chef", "Photographer", "Coach", "Fitness Instructor",
     "Masseus", "Plumber", "Gardener", "Event Planner"].sample,
    hourly_pay: (10..45).to_a.sample,
    summary: "#{Faker::Company.catch_phrase}. #{Faker::Company.catch_phrase}.",
    )
  user = users[iter]
  freelancer.user = user
  freelancer.user.has_freelancer = true
  freelancer.user.save!
  freelancer.save!
  5.times do
    skill = Skill.new(
      name: Faker::Job.key_skill,
      )
    skill.freelancer = freelancer
    skill.save!

    experience = Experience.new(
      title: Faker::Job.title,
      company: Faker::Company.name,
      location: "#{Faker::Address.city} #{Faker::Address.state_abbr}",
      starting_date: Faker::Date.between((3..7).to_a.sample.years.ago, (1..3).to_a.sample.years.ago),
      ending_date: Faker::Date.between(Date.today, (1..8).to_a.months.ago),
      description: Faker::Company.catch_phrase
      )
    experience.freelancer = freelancer
    experience.save!
  end
  iter += 1
end
