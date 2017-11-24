Skill.destroy_all
Experience.destroy_all
Freelancer.destroy_all
User.destroy_all

30.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: 'password',
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.cell_phone,
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

users = User.all.sample(20)
iter = 0

20.times do
  freelancer = Freelancer.new(
    position: ["Painter", "Cook", "Photographer", "Coach", "Fitness Instructor", "Masseus", "Plumber", "Gardner"].sample,
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
