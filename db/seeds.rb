require 'open-uri'

Skill.destroy_all
Experience.destroy_all
Freelancer.destroy_all
User.destroy_all

num_users = 10
repeats = 3
repeats.times.with_index do |index|
  puts "Repeat ##{index + 1}"
  random_person_url_nl = "https://randomuser.me/api/?results=#{num_users}&nat=nl"
  random_person_url_us = "https://randomuser.me/api/?results=#{num_users}&nat=us"
  random_person_url_gb = "https://randomuser.me/api/?results=#{num_users}&nat=gb"
  random_person_url_fr = "https://randomuser.me/api/?results=#{num_users}&nat=fr"

  puts "Creating NL users"
  rand_users_nl = JSON.parse(open(random_person_url_nl).string)["results"]
  rand_users_nl.each_with_index do |rand_user, index2|
    User.create(
      first_name: rand_user["name"]["first"].capitalize,
      last_name: rand_user["name"]["last"].capitalize,
      password: 'password',
      email: "#{rand_user["name"]["first"]}.#{rand_user["name"]["last"]}@gmail.com",
      phone_number: "+31 #{rand_user["cell"]}",
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
      photo: rand_user["picture"]["large"]
    )
  end

  puts "Creating US users"
  rand_users_us = JSON.parse(open(random_person_url_us).string)["results"]
  rand_users_us.each_with_index do |rand_user, index2|
    User.create(
      first_name: rand_user["name"]["first"].capitalize,
      last_name: rand_user["name"]["last"].capitalize,
      password: 'password',
      email: "#{rand_user["name"]["first"]}.#{rand_user["name"]["last"]}@gmail.com",
      phone_number: "+1 #{rand_user["cell"]}",
      location: ["Woodlawn, MD", "Parkville, MD", "Pikesville, MD", "Carney, MD", "Towson, MD",
        "Middle River, MD", "Essex, MD", "Dundalk, MD", "Milford Mill, MD", "Perry Hall, MD",
        "Randallstown, MD", "Owings Mill, MD", "Cockeysville, MD", "Rosedale, MD", "Arbutus, MD", "Columbia, MD", "Timonium, MD",
        "Baltimore, MD", "Catonsville, MD", "Allegany County, MD", "Anne Arundel County, MD",
        "Carroll County, MD", "Harford County, MD", "St. Mary's County, MD", "Cecil County, MD",
        "Howard County, MD", "Somerset County, MD", "Baltimore City, MD", "Charles County, MD",
        "Kent County, MD", "Talbot County, MD", "Baltimore County, MD", "Dorchester County, MD",
        "Montgomery County, MD", "Washington County, MD", "Calvert County, MD", "Frederick County, MD",
        "Prince George's County, MD", "Wicomico County, MD", "Caroline County, MD", "Garrett County, MD",
        "Queen Anne's County, MD", "Worcester County, MD", "University of Maryland, Baltimore County, MD"].sample,
      photo: rand_user["picture"]["large"],
    )
  end

  puts "Creating GB users"
  rand_users_gb = JSON.parse(open(random_person_url_gb).string)["results"]
  rand_users_gb.each_with_index do |rand_user, index2|
    User.create(
      first_name: rand_user["name"]["first"].capitalize,
      last_name: rand_user["name"]["last"].capitalize,
      password: 'password',
      email: "#{rand_user["name"]["first"]}.#{rand_user["name"]["last"]}@gmail.com",
      phone_number: "+44 #{rand_user["cell"]}",
      location: ["Spalding, England", "Hever, England", "Usk, England", "Abingdon, England",
        "Fountains, England", "Hastings, England", "Canderbury, England", "LLawhaden, England",
        "Darley, England", "Chichester, England", "Ampthill, England", "Bolingbroke, England",
        "Caister, England", "Hertford, England", "Midurst, England", "Morecambe, England",
        "Peterborough, England", "Worstead, England", "Wressle, England", "Kirby, England", "Edington, England",
        "Amersham, England", "Reculver, England", "Stafford, England", "Southampton, England"].sample,
      photo: rand_user["picture"]["large"]
    )
  end

  puts "Creating FR users"
  rand_users_fr = JSON.parse(open(random_person_url_fr).string)["results"]
  rand_users_fr.each do |rand_user, index2|
    User.create(
      first_name: rand_user["name"]["first"].capitalize,
      last_name: rand_user["name"]["last"].capitalize,
      password: 'password',
      email: "#{rand_user["name"]["first"]}.#{rand_user["name"]["last"]}@gmail.com",
      phone_number: "+33 #{rand_user["cell"]}",
      location: ["Frigoulet, France", "Francarville, France", "Fronholtz, France", "Robehomme, France",
        "Bourgnaudin, France", "Mont, France", "Voglans, France", "Chauconin, France",
        "Bonnieux, France", "Vaudoeuvre, France", "Longeville, France", "Bousseviller, France",
        "Erre, France", "Migné, France", "Boutancourt, France", "Socoa, France", "Montbert, France",
        "Xivray, France", "Charbonnier, France", "Mottier, France", "Treyches, France", "Lafaurie, France",
        "Challain, France", "Houdent, France", "Valeuil"].sample,
      photo: rand_user["picture"]["large"]
    )
  end
end

users = User.all.sample(User.all.length - 10)
iter = 0

(User.all.length - 10).times do
  summary = ["I am a huge people-person and spent several years in Banking, but a few years ago a serendipitous event
    inspired me to get into Technical Recruiting, and I love it! There is nothing greater than finding opportunities for smart
    people to do awesome things, and it's a fantastic process that I feel lucky to participate in. When I'm not working,
    I am usually with my 4 year old Pitbull/German Shepard mix (yup, he's still a pup), who loves to run and exercise even more than I do.
    I am very much a kid at heart, love to cook, watch football (Niners and Broncos baby!), play video games, and travel whenever I'm awarded the opportunity.
    I love meeting new people and learning new things, so please feel free to say hello and share a story with me. I am thrilled, and truly blessed to be a part of the Unity family!",
    "After the realisation set in that I will not be making it as a pro footballer or Wimbledon great (I wasn't close),
    I spent many evenings trawling the local press and digital job boards seeking the dream role that was out of reach.
    So it is no surprise that I now work in an industry which rewards me for helping people realise their potential and setting them on their way to achieving great things.
    After 10+ years in agency, onsite and inhouse recruitment I get as excited today as I did back then when seeing both my business and candidates prosper.
    Truly partnering with my leaders to help them think differently and coaching the talent I work with to attain the unattainable is what motivates me to continuously improve
    in this ever evolving industry. I am also focused on putting my passions and skills to good use by supporting organisations and projects that I really care
    about whether it’s giving some time to the great food sustainability charity OzHarvest or driving key diversity initiatives at CommBank from LGBTI to
    gender equality to creating greater cultural awareness. If you believe that I can be of help to you or if you would like to learn more about careers
    @ CommBank please get in touch or connect.", "I thrive in rapidly growing, innovative organizations, I'm passionate about technology and providing the
    best recruiting experience for candidates and my hiring manager. I love traveling the world and eating my way through the places I visit. In my spare time,
    I'm searching for travel deals or playing with the nearest dog.", "Outside of the office, I'm committed to education and tutor through CPS.
    I’m fluent in Spanish (and speak a little Portuguese and Arabic), and am always looking to brush up my language skills over coffee or drinks.
    If you challenge me to Star Wars trivia, I will win. I live the sweaty life and will probably \"recruit\" you to join me for a barre class or a run.
    Connect with me over LinkedIn for networking, career opportunities, and more!", "Every brand has stories to tell—stories that will not only engage, inform,
    surprise, delight, and impact their audience, but that will also deliver on measurable business goals. And I am the conduit between brand and consumer.
    I help clients find the subject and medium that best fits their unique identity, and then I produce high-quality content that meets their objectives.",
    "When I was 21, I climbed Mount Everest. Not metaphorically—I literally climbed the highest mountain on Earth. While I was hiking, I thought about quitting
    approximately 5,000 times. (And that’s a lowball estimate.) But despite the high winds, low altitude, mental and physical fatigue, and trail mix overdose,
    I kept going. I’m that person. Once I say I’ll do something, it will happen. Now, I put that perseverance to work throughout my freelancing positions.
    I don’t have to climb any mountains…but I do have to move them.", "A skilled communicator; able to maintain cultural sensitivity, establish rapport with
    members of diverse groups, and promote team cohesiveness.", "Highly organized and independent; able to effectively coordinate tasks to accomplish projects
    with timeliness and creativity.", "An organized, detail-oriented, and conscientious self-starter, able to strategize and prioritize effectively to accomplish
    multiple tasks and stay calm under pressure.", "Flexible and analytical with a keen eye for details; skilled at synthesizing and editing information to achieve overall
    objectives.", "An effective leader, skilled in enlisting the support of all team members in aligning with project and organizational goals.", "High-energy, confident
    professional with an infectious enthusiasm for technology.", "Particular strength in bridging cultural gaps among people through education and interpersonal relations.",
    "An organized and detail-oriented manager, able to prioritize and delegate tasks effectively to ensure timely project completion within a team environment.", "Known for an interactive
    teaching style that encourages student participation and enthusiasm while facilitating learning.", "Experienced supervisor with a management style that motivates staff productivity.",
    "Decisive, efficient team approach; outstanding communication skills.", "A dedicated and enthusiastic manager, able to motivate teams to perform at their best in providing excellent service and
    developing ongoing, profitable client relationships.", "An experienced supervisor and trainer; able to explain information clearly, recognize excellence in individuals,
    and inspire team members to achieve their potential while working toward common goals.", "Strong meeting planning and facilitation skills; able to communicate effectively with all
    organizational levels, build relationships of trust and enlist the participation of team members.", "Highly organized and efficient in fast-paced multitasking environments;
    able to prioritize effectively to accomplish objectives with creativity, enthusiasm and humor.",
    "Creative, resourceful and flexible, able to adapt to changing priorities and maintain a positive attitude and strong work ethic."].sample
  freelancer = Freelancer.new(
    position: ["Painter", "Photographer","Plumber", "Event Planner"].sample,
    hourly_pay: (10..45).to_a.sample,
    avg_rating: [2, 2.5, 3, 3.5, 4, 4.5, 5].sample,
    summary: summary,
  )
  user = users[iter]
  freelancer.user = user
  freelancer.user.has_freelancer = true
  freelancer.user.save!
  freelancer.save!
  puts "Creating Offers"
  (1..10).to_a.sample.times do
    Offer.create(
      user: users[rand(User.all.length - 1)],
      freelancer: freelancer,
      status: (1..3).to_a.sample,
      budget: (50..200).to_a.sample.round(-1),
      price: (10..50).to_a.sample,
      description: Faker::Company.bs,
    )
  end

  puts "Creating Skills"
  (3..20).to_a.sample.times do
    skill_rand = ["Able to Listen", "Accept Feedback", "Adaptable", "Artistic Sense", "Assertive", "Attentive",
      "Business Storytelling", "Business Trend Awareness", "Collaborating", "Communication",
      "Competitive", "Confident", "Conflict Management", "Conflict Resolution", "Cooperative",
      "Courteous", "Crisis Management", "Critical Observer", "Critical Thinker", "Customer Service",
      "Deal Making", "Deal with Difficult Situations", "Deal with Office Politics", "Deals with Difficult People",
      "Decision Making", "Dedicated", "Delegation", "Dependable", "Design Sense", "Desire to Learn", "Disability Awareness",
      "Dispute Resolution", "Diversity Awareness", "Effective Communicator", "Emotion Management", "Emotional Intelligence", "Empathetic",
      "Energetic", "Enthusiastic", "Ergonomic Sensitivity", "Establish Interpersonal Relationships", "Experience Dealing with Difficult Personalities",
      "Experience", "Facilitating", "Flexible", "Follow Instructions", "Follow Regulations", "Follow Rules", "Friendly",
      "Functions Well Under Pressure", "Giving Feedback", "Good at Networking", "Good at Storytelling",
      "Good Attitude", "High Energy", "Highly Organized", "Highly Recommended", "Honest", "Independent",
      "Persuasive", "Innovator", "Inspiring", "Intercultural Competence", "Interpersonal", "Interviewing",
      "Knowledge Management", "Leadership", "Listening", "Logical Thinking", "Make Deadlines", "Management",
      "Managing Difficult Conversations", "Managing Remote Teams", "Managing Virtual Teams", "Meeting Management",
      "Mentoring", "Motivated", "Motivating", "Multitasking", "Negotiation", "Nonverbal Communication",
      "Organization", "Patience", "Perform Effectively in a Deadline Environment", "Performance Management",
      "Perseverance", "Persistence", "Persuasion", "Physical Communication", "Planning", "Positive Work Ethic",
      "Possess Business Ethics", "Presentation", "Problem Solving", "Process Improvement", "Proper Business Etiquette",
      "Public Speaking", "Punctual", "Quick-witted", "Read Body Language", "Reliable", "Research", "Resilient",
      "Resolving Issues", "Respectful", "Respectable", "Results Oriented", "Safety Conscious", "Scheduling",
      "Self-awareness", "Self-directed", "Self-monitoring", "Self-supervising", "Selling Skills", "Sense of Humor",
      "Social", "Stay on Task", "Strategic Planning", "Stress Management", "Successful Coach", "Supervising",
      "Take Criticism", "Talent Management", "Team Building", "Team Player", "Technology Savvy", "Technology Trend Awareness",
      "Thinks Outside the Box", "Time Management", "Tolerant of Change and Uncertainty", "Train the Trainer", "Trainable", "Training",
      "Troubleshooter", "Value Education", "Verbal Communication", "Visual Communication", "Well Groomed", "Willing to Accept Feedback",
      "Willingness to Learn", "Work Well Under Pressure", "Work-Life Balance", "Writing Experience", "Writing Reports and Proposals", "Writing Skills"].sample
    skill = Skill.new(
      name: skill_rand,
      )
    skill.freelancer = freelancer
    skill.save!
  end

  puts "Creating Experiences"
  (3..7).to_a.sample.times do
    case users[iter].freelancer.position
    when "Painter"
      company = ["Benjamin Moore", "Sherwin-Williams", "Valspar Paint", "Behr", "Dutch Boy",
        "Royal Paint", "Clark Kent Contractors", "Glidden", "Paint Platoon", "Paint Northwest", "Paint Illinois",
        "Painters-Online", "Chicago Paint Pros", "USA Painting Pros"].sample
      title = ["Exterior Painter", "Interior Painter", "Industrial Painter", "Home Painter",
         "Bridge Painter", "Maintenence Painter, Plant", "Painter-decorator", "Roof Painter"].sample
      desc = ["Reading blueprints/instructions and examining surfaces to determine the kind and
              amount of work necessary.", "Making on-site preparations such as building scaffolding,
              covering fixtures etc.", "Preparing walls and other surfaces for painting by scraping,
              using sandpaper, removing old paint etc.", "Fill cracks and holes with appropriate material (e.g. plaster).",
              "Mix paint and other materials to prepare the right color or texture.", "Paint surfaces according to instructions with various tools.",
              "Apply varnish and other finishes.", "Calculate costs and negotiate prices.",
              "Take and adhere to all health and safety precautions.", "Maintain logs of Volatile Organic Compound
              and spray volume", "Determine, cut and apply wallpaper or fabric to walls.", "Remove previous paint by
              means of sandblasting, scraping, sanding, hydro-blasting and steam-cleaning."].sample
    when "Photographer"
      company = ["Pinterest", "AgfaPhoto", "Art Chick Photography", "Boots-UK", "Canon",
          "Photobucket", "Photography Life", "Picture Frames", "Picture People", "Image Shack",
          "Selfies to Selfless", "USA-Pictures", "Photography Blog", "Picture Correct", "Picture Salon"].sample
      title = ["Wedding Photographer", "Freelance Photographer", "Magazine Cover Photographer",
        "Movie Photographer", "Chief Photographer", "Forensic Photographer", "News Photographer",
        "Photojournalist", "Scientific Photographer", "Street Photographer", "Still Photographer",
        "Events Photographer", "Medical Photographer", "Multimedia Photographer"].sample
      desc = ["Working with clients to discuss the images they require and how they want to use them.",
        "Seeking out appropriate photographic subjects and opportunities.", "Working in different locations
        and circumstances to get the right image.", "Managing the processing and use of images, discussing
        technical problems, checking for quality and dealing with clients' concerns.", "Understanding traditional film and
        digital photography and keeping up to date with industry trends, developments and new techniques.",
        "Developing expertise with software to digitally enhance images by, for example, changing emphasis, cropping pictures,
        correcting minor faults or moving objects around.", "Developing a good portfolio, building a network of contacts
        and achieving a reputation for quality and reliability in order to secure future assignments.",
        "Preparing proofs for approval.", "Communicating with photographic subjects, putting them at ease,
        encouraging them and directing them.", "Compiling finished products for sale, such as albums and framed prints."].sample
    when "Plumber"
      company = ["Plumbers Stock", "Plumber Mag", "Plumber.ca", "Ferguson", "Watsco",
            "Winsupply Inc", "Johnstone Solutions", "Construction Dive", "HVAC", "F.W. Webb",
            "Plumbing Zone", "Plumbing Forums", "PM Mag", "Plumbers Crib", "Plumbers Stock"].sample
      title = ["Apprentice Plumber", "Maintenance and Repair Plumber", "Maintenance and Repair Plumber (Insdustry)",
        "Pipefitter", "Plumbing Mechanic", "Master Plumber", "Radiator Plumber", "Residential Construction Plumber",
        "Journeyman Plumber", "Plumbing Installer", "Marine Plumber", "Residential Plumber"].sample
      desc = ["Assemble pipe sections, tubing and fittings, using couplings, clamps, screws, bolts, cement, plastic solvent,
        caulking, or soldering, brazing and welding equipment.", "Fill pipes or plumbing fixtures with water or air and observe
        pressure gauges to detect and locate leaks.", "Review blueprints and building codes and specifications to determine work
        details and procedures.", "Prepare written work cost estimates and negotiate contracts.",
        "Study building plans and inspect structures to assess material and equipment needs, to establish the sequence of pipe installations,
        and to plan installation around obstructions such as electrical wiring.", "Keep records of assignments and produce detailed work reports.",
        "Perform complex calculations and planning for special or very large jobs.",
        "Locate and mark the position of pipe installations, connections, passage holes, and fixtures in structures,
        using measuring instruments such as rulers and levels.", "Measure, cut, thread, and bend pipe to required angle, using hand and power tools or
        machines such as pipe cutters, pipe-threading machines, and pipe-bending machines.",
        "Install pipe assemblies, fittings, valves, appliances such as dishwashers and water heaters, and fixtures such as sinks and toilets,
        using hand and power tools.", "Repair and maintain plumbing, replacing defective washers, replacing or mending broken pipes,
        and opening clogged drains.", "Direct workers engaged in pipe cutting and preassembly and
        installation of plumbing systems and components."].sample
    when "Event Planner"
      company = ["Ticketfly", "Ticketmaster", "Planner 5D", "Colin Cowie", "David Tutera", "EventBrite",
              "Eventful", "Rafanelli Events", "Event Tickets Center", "Eventvods", "BizBash", "Meetingsnet",
              "Special Events", "Catersource"].sample
      title = ["Meeting Planner", "Activities and Events Planner", "Meeting and Event Planner",
        "Event Operations Manager", "Conference Planner", "Association Event Planner",
        "Event Planner/Analyst", "Exhibition Coordinator", "Special Events Planner",
        "Convention Planner", "Legal Marketing and Events Planner", "Senior Event Planner",
        "Field Events Manager", "Event Coordinator"].sample
      desc = ["Event planning, design and production within time limits.", "Working with clients to identify
        their needs and ensure customer satisfaction.", "Organizing facilities and details such as decor, catering, entertainment, transportation, location,
        invitee list, special guests, equipment, promotional material etc.", "Propose ideas to improve provided services and event quality.",
        "Liaise with clients to identify their needs and to ensure customer satisfaction.", "Cooperate with marketing and PR to promote and publicize event.",
        "Proactively handle any arising issues and troubleshoot any emerging problems on the event day.", "Ensure compliance with insurance, legal, health and safety obligations.",
        "Research market, identify event opportunities and generate interest.", "Specify staff requirements and coordinate their activities.",
        "Event planning, design and production while managing all project delivery elements within time limits.",
        "Conduct market research, gather information and negotiate contracts prior to closing any deals."].sample
    end

    experience = Experience.new(
        title: title,
        company: company,
        location: "#{Faker::Address.city} #{Faker::Address.state_abbr}",
        starting_date: Faker::Date.between((3..5).to_a.sample.years.ago, (5..10).to_a.sample.years.ago),
        ending_date: Faker::Date.between((1..3).to_a.sample.years.ago, Date.today),
        description: desc,
        picture: "http://logo.clearbit.com/#{company.split(" ").join("")}.com"
        )
      experience.freelancer = freelancer
      experience.save!
  end
  iter += 1
end
