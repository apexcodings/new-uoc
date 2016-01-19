# ===========================================================
# PAGES
# ===========================================================

Page.delete_all

# ABOUT
about = Page.create!(title: 'About') #p
about.children.create!(title: "History", position: 1) #p
about.children.create!(title: "Refer a Patient", position: 2)
about.children.create!(title: "Mission/Vision/Values", position: 3) #p
about.children.create!(title: "Patient Reviews", position: 4)
#about.children.create!(title: "Hospital Affiliations", position: 5)
#about.children.create!(title: "Community Involvement", position: 6)

# EXPERTS
experts = Page.create!(title: 'Our Experts')
#experts.children.create!(title: "Physicians", position: 1)
#experts.children.create!(title: "Physicians Assistants", position: 2)
#experts.children.create!(title: "Physical Therapists", position: 3)
#experts.children.create!(title: "Clinical Researchers", position: 4)
#experts.children.create!(title: "Worker's Comp Rep", position: 5)
#experts.children.create!(title: "Athletic Trainers Experts", position: 6)
#experts.children.create!(title: "Management", position: 7)

# SPECIALTIES PAGES
specialties = Page.create!(title: 'Specialties')
specialties.children.create!(title: "One team, one goal.", label: "Spine Institute", slug: "spine-institute", position: 1)
specialties.children.create!(title: "Pain Management", position: 2)
specialties.children.create!(title: "A patient-centric approach to care", label: "Joint Replacements", slug: "joint-replacements", position: 3)

# sports sub-pages
sports = specialties.children.create!(title: "Helping the best athletes get better.", label: "Sports Medicine", slug: "sports-medicine-services", position: 4)
sports.children.create!(title: "Strengthening athletes at every level.", label: "Athletic Trainers", slug: "athletic-trainers", position: 1)
sports.children.create!(title: "Advancing the care and treatment of concussions.", label: "Concussion Care", slug: "concussion-care", position: 2)
sports.children.create!(title: "Keeping athletes in the game they love.", label: "Saturday Sports Clinic", slug: "saturday-sports-clinic", position: 3)
sports.children.create!(title: "Primary care sports medicine Fellowship.", label: "Fellowships", slug: "fellowships", position: 4)

specialties.children.create!(title: "Neck & Back", position: 5)
specialties.children.create!(title: "Shoulders", position: 6)
specialties.children.create!(title: "Elbows", position: 7)
specialties.children.create!(title: "Hands & Wrists", position: 8)
specialties.children.create!(title: "Hips", position: 9)
specialties.children.create!(title: "Knees", position: 10)
specialties.children.create!(title: "Feet & Ankles", position: 11)
specialties.children.create!(title: "Other", position: 12)


# SERVICES
services = Page.create!(title: 'Services')

outpatient = services.children.create!(title: "Outpatient Surgical Centers", position: 1)
outpatient.children.create!(title: "UOCSS", position: 1)
outpatient.children.create!(title: "Adv Center for Surgery", position: 2)

services.children.create!(title: "Urgent Orthopedic Care", position: 2)
services.children.create!(title: "Physical/Occupational Therapy", position: 3) #p


services.children.create!(title: "Clinical Research", position: 5)
services.children.create!(title: "Worker’s Compensation", position: 6) #p
services.children.create!(title: "MRI", position: 7)  #p
services.children.create!(title: "Durable Medical Equipment", position: 8)
services.children.create!(title: "Uni-Dose Pharmacy", position: 9)


# CONTACT US
contact = Page.create!(title: 'Contact Us')

contact.children.create!(title: "Altoona", position: 1)
# contact.children.create!(title: "Bedford", position: 2)
contact.children.create!(title: "Dubois", position: 3)
# contact.children.create!(title: "Ebensburg - 2016", position: 4)
contact.children.create!(title: "Huntingdon", position: 5)
contact.children.create!(title: "Lewistown", position: 6)
contact.children.create!(title: "Roaring Springs", position: 7)

state_college = contact.children.create!(title: "State College", position: 8)
state_college.children.create!(title: "Grays Woods", position: 1)

contact.children.create!(title: "Tyrone", position: 9)

Page.create!(title: "Thank You")


# PATIENT RESOURCES
resources = Page.create!(title: 'Patient Resources')
resources.children.create!(title: "Appointments", position: 1)
resources.children.create!(title: "Billing & Insurance", position: 2)
resources.children.create!(title: "Joint Replacement Classes", position: 3)
resources.children.create!(title: "Patient Newsletter", position: 4)
resources.children.create!(title: "Patient Forms", position: 5)

preparing = resources.children.create!(title: "Preparing For...", position: 6)
preparing.children.create!(title: "Appointment", position: 1)
preparing.children.create!(title: "Surgery", position: 2)
preparing.children.create!(title: "Post-Op", position: 3)

resources.children.create!(title: "Privacy Policy", position: 7)
resources.children.create!(title: "Health Grades", position: 8)

# CAREERS
careers = Page.create!(title: 'Careers')

# PATIENT PORTAL
Page.create!(title: "What is NextMD?", position: 1)
Page.create!(title: "Why NextMD?", position: 2)
Page.create!(title: "How NextMD Works", position: 3)
Page.create!(title: "Appointments", slug: "portal-appointments", position: 4)
Page.create!(title: "Messaging", position: 5)
Page.create!(title: "FAQ", position: 6)

# ===========================================================
# EXPERTS
# ===========================================================
Expert.delete_all

Expert.create!([
  # PHYSICIANS
  {
    first_name: "Kenneth L.",
    last_name: "Cherry",
    suffix: "MD",
    phone: "1-800-505-2101",
    location: "State College and Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "KennethCherry.jpg",
    body: File.read("db/experts/cherry.html")
  },
  {
    first_name: "Douglas E.R.",
    last_name: "Roeshot",
    suffix: "MD",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "DouglasRoeshot.jpg",
    body: File.read("db/experts/roeshot.html")
  },
  {
    first_name: "Edwin J.",
    last_name: "Rogusky",
    suffix: "MD",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "EdwinRogusky.jpg",
    body: File.read("db/experts/rogusky.html")
  },
  {
    first_name: "Thomas J.",
    last_name: "Ellis",
    suffix: "DO",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "ThomasEllis.jpg",
    body: File.read("db/experts/ellis.html")
  },
  {
    first_name: "William A.",
    last_name: "Tyndall",
    suffix: "MD, PhD",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "WilliamTyndall.jpg",
    body: File.read("db/experts/tyndall.html")
  },
  {
    first_name: "Gregory M.",
    last_name: "Bailey",
    suffix: "DO",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "GregoryBailey.jpg",
    body: File.read("db/experts/bailey.html")
  },
  {
    first_name: "Bradley A.",
    last_name: "Barter",
    suffix: "DO",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "BradleyBarter.jpg",
    body: File.read("db/experts/barter.html")
  },
  {
    first_name: "Christopher",
    last_name: "McClellan",
    suffix: "DO",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "ChristopherMcClellan.jpg",
    body: File.read("db/experts/mc_clellan.html")
  },
  {
    first_name: "Joel A.",
    last_name: "Torretti",
    suffix: "MD",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "JoelTorretti.jpg",
    body: File.read("db/experts/torretti.html")
  },
  {
    first_name: "Christopher J.",
    last_name: "Lincoski",
    suffix: "MD",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "ChristopherLincoski.jpg",
    body: File.read("db/experts/lincoski.html")
  },
  {
    first_name: "Paul R.",
    last_name: "Sensiba",
    suffix: "MD",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "PaulSensiba.jpg",
    body: File.read("db/experts/sensiba.html")
  },
  {
    first_name: "Dennis M.",
    last_name: "Devita",
    suffix: "MD",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "DennisDevita.jpg",
    body: File.read("db/experts/devita.html")
  },
  {
    first_name: "Harry H.",
    last_name: "Dinsmore",
    suffix: "MD",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "HarryDinsmore.jpg",
    body: File.read("db/experts/dinsmore.html")
  },
  {
    first_name: "Todd B.",
    last_name: "Cousins",
    suffix: "DO",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "ToddCousins.jpg",
    body: File.read("db/experts/cousins.html")
  },
  {
    first_name: "Fred K.",
    last_name: "Khalouf",
    suffix: "DO",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "FredKhalouf.jpg",
    body: File.read("db/experts/khalouf.html")
  },
  {
    first_name: "Keith M.",
    last_name: "Zora",
    suffix: "DO",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "KeithZora.jpg",
    body: File.read("db/experts/zora.html")
  },
  {
    first_name: "Michael",
    last_name: "Doss",
    suffix: "DPM",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "MichaelDoss.jpg",
    body: File.read("db/experts/doss.html")
  },
  {
    first_name: "Paul D.",
    last_name: "Lamb",
    suffix: "DC",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "PaulLamb.jpg",
    body: File.read("db/experts/lamb.html")
  },
  {
    first_name: "David J.",
    last_name: "Bozak",
    suffix: "DO",
    phone: "814-942-1166",
    location: "Altoona",
    specialty: "Physical Medicine and Rehabilitation (Physiatry)",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "david-j-bozak-do_0.jpg",
    body: File.read("db/experts/bozak.html")
  },
  {
    first_name: "Adam M.",
    last_name: "Budny",
    suffix: "DPM",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "adam-m-budny-dpm.jpg",
    body: File.read("db/experts/budny.html")
  },
  {
    first_name: "Eric M.",
    last_name: "Kephart",
    suffix: "DO",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "eric-m-kephart-do_0_0.jpg",
    body: File.read("db/experts/kephart.html")
  },
  {
    first_name: "Alexis N.",
    last_name: "Ley",
    suffix: "DPM",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "dr-ley_0.jpg",
    body: File.read("db/experts/ley.html")
  },
  {
    first_name: "Joshua",
    last_name: "Port",
    suffix: "MD",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "joshua-port-md-200x200_0.jpg",
    body: File.read("db/experts/port.html")
  }, 
  {
    first_name: "Angela W.",
    last_name: "Rowe",
    suffix: "DO",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "rowe.jpg",
    body: File.read("db/experts/rowe.html")
  },
  {
    first_name: "Shawn C.",
    last_name: "Saylor",
    suffix: "DO",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "saylor.jpg",
    body: File.read("db/experts/saylor.html")
  },
  {
    first_name: "Robert J.",
    last_name: "Singer",
    suffix: "DO",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "singer.jpg",
    body: File.read("db/experts/singer.html")
  },
  {
    first_name: "Jonathan P.",
    last_name: "Van Kleunen",
    suffix: "MD",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "kleunen.jpg",
    body: File.read("db/experts/kleunen.html")
  },
  # PHYSICIAN ASSISTANTS
  {
    first_name: "Brett J.",
    last_name: "Beech",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians_assistants",
    image_url: "BrettBeech.jpg",
    body: File.read("db/experts/beech.html")
  },
  {
    first_name: "Todd E.",
    last_name: "Brunermer",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians_assistants",
    image_url: "ToddBrunermer.jpg",
    body: File.read("db/experts/brunermer.html")
  },
  {
    first_name: "Erin",
    last_name: "Gilroy",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians_assistants",
    image_url: "ErinGilroy.jpg",
    body: File.read("db/experts/gilroy.html")
  },
  {
    first_name: "Jennifer M.",
    last_name: "Illig",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians_assistants",
    image_url: "JenniferIllig.jpg",
    body: File.read("db/experts/illig.html")
  },
  {
    first_name: "Shawn",
    last_name: "Kibe",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians_assistants",
    image_url: "ShawnKibe.jpg",
    body: File.read("db/experts/kibe.html")
  },
  {
    first_name: "Mark A.",
    last_name: "Kramer",
    suffix: "ATC, PA-C",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians_assistants",
    image_url: "MarkKramer.jpg",
    body: File.read("db/experts/kramer.html")
  },
  {
    first_name: "Heidi A.",
    last_name: "Murphy",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians_assistants",
    image_url: "HeidiMurphy.jpg",
    body: File.read("db/experts/murphy.html")
  },
  {
    first_name: "Aaron",
    last_name: "Thompson",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians_assistants",
    image_url: "AaronThompson.jpg",
    body: File.read("db/experts/thompson.html")
  },
  {
    first_name: "John M.",
    last_name: "Vargo Jr.",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians_assistants",
    image_url: "JohnVargo.jpg",
    body: File.read("db/experts/vargo.html")
  },
  {
    first_name: "Erin M.",
    last_name: "Veneziano",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians_assistants",
    image_url: "ErinVeneziano.jpg",
    body: File.read("db/experts/veneziano.html")
  },
  # PHYSICAL THERAPISTS
  {
    first_name: "Elaine",
    last_name: "Barch",
    suffix: "PT, DPT, CHT, CEAS",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physical_therapists",
    image_url: "ElaineBarch.jpg",
    body: File.read("db/experts/barch.html")
  },
  {
    first_name: "Joe",
    last_name: "Brescia",
    suffix: "MS, OTR/L, CHT",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physical_therapists",
    image_url: "JosephBrescia.jpg",
    body: File.read("db/experts/brescia.html")
  },
  {
    first_name: "Colleen",
    last_name: "Cingle",
    suffix: "MSPT",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physical_therapists",
    image_url: "ColleenCingle.jpg",
    body: File.read("db/experts/cingle.html")
  },
  {
    first_name: "Chris",
    last_name: "Fisher",
    suffix: "MPT",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physical_therapists",
    image_url: "ChrisFisher.jpg",
    body: File.read("db/experts/fisher.html")
  },
  {
    first_name: "John",
    last_name: "Kravetz",
    suffix: "MPT",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physical_therapists",
    image_url: "JohnKravetz.jpg",
    body: File.read("db/experts/kravetz.html")
  },
  {
    first_name: "Mary Jo",
    last_name: "McClellan",
    suffix: "MPT",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physical_therapists",
    image_url: "MaryJoMcClellan.jpg",
    body: File.read("db/experts/mary_mc_clellan.html")
  },
  {
    first_name: "Pamela",
    last_name: "Mitchell",
    suffix: "MPT",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physical_therapists",
    image_url: "PamelaMitchell.jpg",
    body: File.read("db/experts/mitchell.html")
  },
  {
    first_name: "Duane L.",
    last_name: "Peachy",
    suffix: "MS, PT",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physical_therapists",
    image_url: "DuanePeachy.jpg",
    body: File.read("db/experts/peachy.html")
  },
  {
    first_name: "Sonya",
    last_name: "Storll",
    suffix: "MPT",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physical_therapists",
    image_url: "SonyaStorll.jpg",
    body: File.read("db/experts/storll.html")
  },
  {
    first_name: "Christopher",
    last_name: "Szabat",
    suffix: "DPT, ATC, CSCS",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physical_therapists",
    image_url: "ChristopherSzabat.jpg",
    body: File.read("db/experts/szabat.html")
  },
  # ATHLETIC TRAINERS
  {
    first_name: "Carley",
    last_name: "Casado",
    suffix: "MA, LAT, ATC",
    phone: "",
    location: "Altoona",
    specialty: "",
    procedures: "",
    education: "",
    category: "athletic_trainers",
    image_url: "CarleyCasado.jpg",
    body: File.read("db/experts/casado.html")
  },
  {
    first_name: "Samantha",
    last_name: "Debias",
    suffix: "MS, LAT, ATC",
    phone: "",
    location: "Altoona",
    specialty: "",
    procedures: "",
    education: "",
    category: "athletic_trainers",
    image_url: "SamanthaDebias.jpg",
    body: File.read("db/experts/debias.html")
  },
  {
    first_name: "Jihan",
    last_name: "Dodson",
    suffix: "LAT, ATC",
    phone: "",
    location: "Altoona",
    specialty: "",
    procedures: "",
    education: "",
    category: "athletic_trainers",
    image_url: "JihanDodson.jpg",
    body: File.read("db/experts/dodson.html")
  },
  {
    first_name: "Margaret",
    last_name: "Hornbake",
    suffix: "LAT, ATC",
    phone: "",
    location: "Altoona",
    specialty: "",
    procedures: "",
    education: "",
    category: "athletic_trainers",
    image_url: "MaggieHornbake.jpg",
    body: File.read("db/experts/hornbake.html")
  },
  {
    first_name: "Zachary",
    last_name: "Kavo",
    suffix: "MS, LAT, ATC",
    phone: "",
    location: "Altoona",
    specialty: "",
    procedures: "",
    education: "",
    category: "athletic_trainers",
    image_url: "ZacharyKavo.jpg",
    body: File.read("db/experts/kavo.html")
  },
  {
    first_name: "Donna A.",
    last_name: "Kellogg",
    suffix: "ATC",
    phone: "",
    location: "Altoona",
    specialty: "",
    procedures: "",
    education: "",
    category: "athletic_trainers",
    image_url: "DonnaYarros.jpg",
    body: File.read("db/experts/kellogg.html")
  },
  {
    first_name: "Alison",
    last_name: "Krajewski",
    suffix: "ATC, MS",
    phone: "",
    location: "Altoona",
    specialty: "",
    procedures: "",
    education: "",
    category: "athletic_trainers",
    image_url: "AlisonKrajewski.jpg",
    body: File.read("db/experts/krajewski.html")
  },
  {
    first_name: "John A.",
    last_name: "Smaniotto",
    suffix: "MS, LAT, ATC, OTC, CSCS",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "athletic_trainers",
    image_url: "JohnSmaniotto.jpg",
    body: File.read("db/experts/smaniotto.html")
  },
  {
    first_name: "Kelsey",
    last_name: "Ulrich",
    suffix: "LAT, ATC",
    phone: "",
    location: "Altoona",
    specialty: "",
    procedures: "",
    education: "",
    category: "athletic_trainers",
    image_url: "KelseyUlrich.jpg",
    body: File.read("db/experts/ulrich.html")
  },
  {
    first_name: "Regis",
    last_name: "Visconti Jr.",
    suffix: "LAT, ATC, EMT-B, PES, ROT",
    phone: "",
    location: "Altoona",
    specialty: "",
    procedures: "",
    education: "",
    category: "athletic_trainers",
    image_url: "RegisVisconti.jpg",
    body: File.read("db/experts/visconti.html")
  },
  {
    first_name: "Sue",
    last_name: "Jepson",
    suffix: "",
    phone: "",
    location: "Altoona",
    specialty: "",
    procedures: "",
    education: "",
    category: "clinical_researchers",
    image_url: "SueJepson.jpg",
    body: File.read("db/experts/jepson.html")
  },
  {
    first_name: "Robin",
    last_name: "Stern",
    suffix: "RN, BSN, CCRC, CCP",
    phone: "",
    location: "Altoona",
    specialty: "",
    procedures: "",
    education: "",
    category: "clinical_researchers",
    image_url: "RobinStern.jpg",
    body: File.read("db/experts/stern.html")
  }
])


# NEWS

NewsRelease.delete_all

NewsRelease.create!([
  {
  title: "Dr. Angela Rowe selected for osteopathic organization board of directors",
  created_at: DateTime.strptime('09/21/2015', '%m/%d/%Y'),
  body: File.read("db/news/1.html")
  },
  {
  title: "Local surgeons attend National Surgical Association’s Scientific Conference", 
  created_at: DateTime.strptime('06/12/2015', '%m/%d/%Y'),
  body: File.read("db/news/2.html")
  },
  {
  title: "Power mowers pose danger to feet", 
  created_at: DateTime.strptime('06/03/2015', '%m/%d/%Y'),
  body: File.read("db/news/3.html")
  },
  {
  title: "Blair Orthopedics named official Team Physicians for Penn State Altoona", 
  created_at: DateTime.strptime('05/22/2015', '%m/%d/%Y'),
  body: File.read("db/news/4.html")
  },
  {
  title: "Dr. Budny/Ley coauthored article published in The Journal of Foot and Ankle Surgery", 
  created_at: DateTime.strptime('05/01/2015', '%m/%d/%Y'),
  body: File.read("db/news/5.html")
  },
])
