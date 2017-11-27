require 'open-uri'

Skill.destroy_all
Experience.destroy_all
Freelancer.destroy_all
User.destroy_all

num_users = 1
random_person_url_nl = "https://randomuser.me/api/?results=#{num_users}&nat=nl"
random_person_url_us = "https://randomuser.me/api/?results=#{num_users}&nat=us"

rand_users_nl = JSON.parse(open(random_person_url_nl).string)["results"]
rand_users_nl.each do |rand_user|
  User.create(
    first_name: rand_user["name"]["first"],
    last_name: rand_user["name"]["last"],
    password: 'password',
    email: , "#{rand_user["name"]["first"]}.#{rand_user["name"]["last"]}@gmail.com"
    phone_number: "+31#{rand_user["cell"]}",
    location: "#{rand_user["location"]["street"]}, #{rand_user["location"]["city"]}",
      has_freelancer: true
    )
end
rand_users_nl = JSON.parse(open(random_person_url_us).string)["results"]
rand_users_us.each do |rand_user|
  User.create(
    first_name: rand_user["name"]["first"],
    last_name: rand_user["name"]["last"],
    password: 'password',
    email: , "#{rand_user["name"]["first"]}.#{rand_user["name"]["last"]}@gmail.com"
    phone_number: "+1#{rand_user["cell"]}",
    location: ["Amsterdam", "Amsterdam Centraal, Stationsplein, Amsterdam, Netherlands",
      "Westerstraat, Amsterdam, Netherlands", "Borssenburgplein 11#{(0..9).to_a.sample}, Amsterdam",
      "Jisperveldstraat 11#{(0..9).to_a.sample}, Amsterdam", "Argonautenstraat 16#{(0..9).to_a.sample}, Amsterdam",
      "Van Woustraat 2#{(0..9).to_a.sample}, Amsterdam", "Molukkenstraat 2#{(0..9).to_a.sample}, Amsterdam",
      "Radarweg 18#{(0..9).to_a.sample}, Amsterdam", "A-Lab, Amsterdam",
      "Red Light Secrets, Amsterdam", "Body Worlds, Amsterdam", "Sexmuseum, Amsterdam",
      "Vinkenstraat #{(0..80).to_a.sample}, Amsterdam", "Nicolaas Maesstraat #{(0..150).to_a.sample}"].sample,
      has_freelancer: true
    )
end

users = User.all.sample(num_users)
iter = 0

1.times do
  freelancer = Freelancer.new(
    position: ["Painter", "Chef", "Photographer", "Coach", "Fitness Instructor", "Masseus", "Plumber", "Gardener"].sample,
    hourly_pay: (0..100).to_a.sample,
    summary: Faker::Company.catch_phrase,
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
      location: "#{Faker::Address.street_address}, #{Faker::Address.city} #{Faker::Address.state_abbr}, #{Faker::Address.zip}",
      starting_date: Faker::Date.between((1..30).to_a.sample.days.ago, Date.today),
      ending_date: Faker::Date.between(Date.today, Faker::Date.forward((1..30).to_a.sample)),
      description: Faker::Company.catch_phrase
      )
    experience.freelancer = freelancer
    experience.save!
  end
  iter += 1
end
