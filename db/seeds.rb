Offer.destroy_all
Message.destroy_all
Skill.destroy_all
Experience.destroy_all
Freelancer.destroy_all
User.destroy_all

25.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: 'password',
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.cell_phone,
    location: Faker::Address.city,
    has_freelancer: true
  )

  freelancer = Freelancer.new(
    hourly_pay: (0..100).to_a.sample,
    summary: Faker::Company.catch_phrase,
  )
  freelancer.user = user
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
    location: Faker::Address.city,
    starting_date: Faker::Date.between((1..30).to_a.sample.days.ago, Date.today),
    ending_date: Faker::Date.between(Date.today, Date.today),
    description: Faker::Lorem.sentence(3)
    )
  experience.freelancer = freelancer
  experience.save!
  end
end
