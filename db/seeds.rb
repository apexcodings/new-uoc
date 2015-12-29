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
about.children.create!(title: "Hospital Affiliations", position: 5)
about.children.create!(title: "Community Involvement", position: 6)

# EXPERTS
experts = Page.create!(title: 'Our Experts')
experts.children.create!(title: "Physicians", position: 1)
experts.children.create!(title: "Physicians Assistants", position: 2)
experts.children.create!(title: "Physical Therapists", position: 3)
experts.children.create!(title: "Clinical Researchers", position: 4)
experts.children.create!(title: "Worker's Comp Rep", position: 5)
experts.children.create!(title: "Athletic Trainers Experts", position: 6)
experts.children.create!(title: "Management", position: 7)

# SPECIALTIES
specialties = Page.create!(title: 'Specialties')
specialties.children.create!(title: "Spine", position: 1) #p
specialties.children.create!(title: "Pain Management", position: 2)
specialties.children.create!(title: "Chiropractic", position: 3)
specialties.children.create!(title: "Joint Replacements", position: 4)
specialties.children.create!(title: "Sports Medicine", position: 5)
specialties.children.create!(title: "Foot & Ankle", position: 6)
specialties.children.create!(title: "Hand", position: 7)
specialties.children.create!(title: "Gen Ortho", position: 8)


# SERVICES
services = Page.create!(title: 'Services')

outpatient = services.children.create!(title: "Outpatient Surgical Centers", position: 1)
outpatient.children.create!(title: "UOCSS", position: 1)
outpatient.children.create!(title: "Adv Center for Surgery", position: 2)

services.children.create!(title: "Urgent Ortho Care", position: 2)
services.children.create!(title: "Physical/Occupational Therapy", position: 3) #p

sports = services.children.create!(title: "Sports Medicine Services", position: 4)
sports.children.create!(title: "Athletic Trainers", position: 1)
sports.children.create!(title: "Concussion Care", position: 2)
sports.children.create!(title: "Saturday Sports Clinic", position: 3)
sports.children.create!(title: "Fellowships", position: 4)

services.children.create!(title: "Clinical Research", position: 5)
services.children.create!(title: "Worker’s Comp", position: 6) #p
services.children.create!(title: "MRI", position: 7)  #p
services.children.create!(title: "Durable Medical Equipment", position: 8)
services.children.create!(title: "Uni-Dose Pharmacy", position: 9)


# CONTACT US
contact = Page.create!(title: 'Contact Us')
state_college = contact.children.create!(title: "State College", position: 1)
state_college.children.create!(title: "Grays Woods", position: 1)

contact.children.create!(title: "Altoona", position: 2)
contact.children.create!(title: "Lewistown", position: 3)
contact.children.create!(title: "Tyrone", position: 4)
contact.children.create!(title: "Bedford", position: 5)
contact.children.create!(title: "Dubois", position: 6)
contact.children.create!(title: "Huntingdon", position: 7)
contact.children.create!(title: "Roaring Springs", position: 8)
contact.children.create!(title: "Ebensburg - 2016", position: 9)


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
careers = Page.create!(title: 'Careers') #p


# ===========================================================
# EXPERTS
# ===========================================================
Expert.delete_all

Expert.create!([
  {
    name: "Kenneth L. Cherry MD",
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
    name: "Douglas E.R. Roeshot MD",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "DouglasRoeshot.jpg",
    body: "<p>Sit necessitatibus voluptatum quidem quae a officia consectetur. Natus repellendus reprehenderit excepturi a totam consequatur reprehenderit. Quae sed dolorem nemo ea necessitatibus placeat ipsa ratione similique ea nostrum ea, facilis.</p>"
  },
  {
    name: "Edwin J. Rogusky MD",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "EdwinRogusky.jpg",
    body: "<p>Sit necessitatibus voluptatum quidem quae a officia consectetur. Natus repellendus reprehenderit excepturi a totam consequatur reprehenderit. Quae sed dolorem nemo ea necessitatibus placeat ipsa ratione similique ea nostrum ea, facilis.</p>"
  },
  {
    name: "Gregory M. Bailey DO",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians",
    image_url: "GregoryBailey.jpg",
    body: "<p>Sit necessitatibus voluptatum quidem quae a officia consectetur. Natus repellendus reprehenderit excepturi a totam consequatur reprehenderit. Quae sed dolorem nemo ea necessitatibus placeat ipsa ratione similique ea nostrum ea, facilis.</p>"
  },
  {
    name: "Brett J. Beech PA-C",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians_assistants",
    body: "<p>Sit necessitatibus voluptatum quidem quae a officia consectetur. Natus repellendus reprehenderit excepturi a totam consequatur reprehenderit. Quae sed dolorem nemo ea necessitatibus placeat ipsa ratione similique ea nostrum ea, facilis.</p>"
  },
  {
    name: "Todd E. Brunermer PA-C",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physicians_assistants",
    body: "<p>Sit necessitatibus voluptatum quidem quae a officia consectetur. Natus repellendus reprehenderit excepturi a totam consequatur reprehenderit. Quae sed dolorem nemo ea necessitatibus placeat ipsa ratione similique ea nostrum ea, facilis.</p>"
  },
  {
    name: "Elaine Barch PT, DPT, CHT, CEAS",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physical_therapists",
    body: "<p>Sit necessitatibus voluptatum quidem quae a officia consectetur. Natus repellendus reprehenderit excepturi a totam consequatur reprehenderit. Quae sed dolorem nemo ea necessitatibus placeat ipsa ratione similique ea nostrum ea, facilis.</p>"
  },
  {
    name: "Joe Brescia MS, OTR/L, CHT",
    phone: "1-800-505-2101",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Emergency Surgery",
    procedures: "Foot and Ankle Surgery",
    education: "University of California San Diego",
    category: "physical_therapists",
    body: "<p>Sit necessitatibus voluptatum quidem quae a officia consectetur. Natus repellendus reprehenderit excepturi a totam consequatur reprehenderit. Quae sed dolorem nemo ea necessitatibus placeat ipsa ratione similique ea nostrum ea, facilis.</p>"
  }
])
