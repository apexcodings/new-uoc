# ===========================================================
# PAGES
# ===========================================================

Page.delete_all

# ABOUT
about = Page.create!(title: "Get to know us.", label: 'About', slug: "about") 
about.children.create!(title: "History", position: 1) #p
about.children.create!(title: "Refer a Patient", position: 2)
about.children.create!(title: "Mission/Vision/Values", position: 3) #p
reviews = about.children.create!(title: "Patient Reviews", position: 4)
reviews.children.create!(title: "Submit a Review", slug: "submit-review")

# EXPERTS
experts = Page.create!(title: "The right care for your care.", label: 'Our Experts', slug: "our-experts", image_url: "UOC_ourExperts.jpg")

# SPECIALTIES PAGES
specialties = Page.create!(title: "Supporting patients every step of the way.", label: 'Specialties', slug: "specialties", image_url: "specialties.jpg")
specialties.children.create!(title: "One team, one goal.", label: "Spine Institute", slug: "spine-institute", image_url: "Spec_SpineInstitute.jpg", position: 1)
specialties.children.create!(title: "Pain Management", image_url: "Spec_PainManagement.jpg", position: 2)
specialties.children.create!(title: "A patient-centric approach to care", label: "Joint Replacements", slug: "joint-replacements", image_url: "Spec_JointReplacement.jpg", position: 3)

# sports sub-pages
sports = specialties.children.create!(title: "Helping the best athletes get better.", label: "Sports Medicine", slug: "sports-medicine-services", image_url: "Spec_SportsMedicine.jpg", position: 4)
sports.children.create!(title: "Strengthening athletes at every level.", label: "Athletic Trainers", slug: "athletic-trainers", position: 1)
sports.children.create!(title: "Advancing the care and treatment of concussions.", label: "Concussion Care", slug: "concussion-care", position: 2)
sports.children.create!(title: "Keeping athletes in the game they love.", label: "Saturday Sports Clinic", slug: "saturday-sports-clinic", position: 3)
sports.children.create!(title: "Primary care sports medicine Fellowship.", label: "Fellowships", slug: "fellowships", position: 4)

specialties.children.create!(title: "Relieving symptoms. Restoring health.", label: "Chiropractic Care", slug: "chiropractic-care", image_url: "Spec_Chiropractic.jpg", position: 5)

specialties.children.create!(title: "Neck & Back", position: 6)
specialties.children.create!(title: "Shoulders", position: 7)
specialties.children.create!(title: "Elbows", position: 8)
specialties.children.create!(title: "Hands & Wrists", position: 9)
specialties.children.create!(title: "Hips", position: 10)
specialties.children.create!(title: "Knees", position: 11)
specialties.children.create!(title: "Feet & Ankles", position: 12)
specialties.children.create!(title: "Other", position: 13)


# SERVICES
services = Page.create!(title: 'Not all injuries are created equal.', label: "Services", slug: "services", image_url: "Serv_landingPage.jpg")

outpatient = services.children.create!(title: "Building a better solution for recovery.", label: "Surgical Services", slug: "surgical-services", image_url: "Serv_SurgicalServices.jpg", position: 1)
outpatient.children.create!(title: "Leading the way in total joint replacement.", label: "UOC Surgery Center", slug: "uocss", position: 1)
outpatient.children.create!(title: "Providing better surgery solutions.", label: "Advanced Center for Surgery", slug: "adv-center-for-surgery", position: 2)

services.children.create!(title: "Ensuring greater accessibility to care.", label: "Urgent Care", slug: "urgent-care", image_url: "Serv_UrgentCare.jpg", position: 2)
services.children.create!(title: "Improving mobility, function and life.", label: "Physical/Occupational Therapy", slug: "physical-occupational-therapy", image_url: "Serv_PhysOccTherapy.jpg", position: 3)

services.children.create!(title: "Advancing treatment through a deeper understanding.", label: "Clinical Trials", image_url: "Serv_ClinicalTrials.jpg", slug: "clinical-trials", position: 5)
services.children.create!(title: "Helping employees get back to health and back to work.", label: "Worker’s Compensation", slug: "worker-s-compensation", image_url: "Serv_WorkersComp.jpg", position: 6)
services.children.create!(title: "Using technology to ensure a safer, more effective diagnosis.", slug: "mri", label: "MRI", image_url: "Serv_MRI.jpg", position: 7)
services.children.create!(title: "Supplying everything patients need for recovery.", label: "Durable Medical Equipment", slug: "durable-medical-equipment", image_url: "Serv_DurableMedEquip.jpg", position: 8)
services.children.create!(title: "Adding new standards of convenience for patients.", label: "Uni-Dose Pharmacy", slug: "uni-dose-pharmacy", image_url: "Serv_UniDosePharmacy.jpg", position: 9)


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

resources.children.create!(title: "News", position: 6)

preparing = resources.children.create!(title: "Preparing For...", position: 6)
preparing.children.create!(title: "Appointment", position: 1)
preparing.children.create!(title: "Surgery", position: 2)
preparing.children.create!(title: "Post-Op", position: 3)

resources.children.create!(title: "Privacy Policy", position: 7)
resources.children.create!(title: "Health Grades", position: 8)

# CAREERS
careers = Page.create!(title: 'Careers', image_url: "UOC_Careers.jpg")

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
    phone: "(814) 231-2101",
    location: "State College & Altoona, PA",
    specialty: "Total Joint Replacements, Hip & Knee",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "KennethCherry.jpg",
    body: File.read("db/experts/cherry.html")
  },
  {
    first_name: "Douglas E.R.",
    last_name: "Roeshot",
    suffix: "MD",
    phone: "(814) 231-2101",
    location: "State College",
    specialty: "Total Joint Replacements, 
                Hip, knee, shoulder, hand, & wrist, 
                Sports Medicine",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "DouglasRoeshot.jpg",
    body: File.read("db/experts/roeshot.html")
  },
  {
    first_name: "Edwin J.",
    last_name: "Rogusky",
    suffix: "MD",
    phone: "(814) 231-2101",
    location: "State College & Lewistown",
    specialty: "Total Joint Replacements, Shoulders, Sports Injuries",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "EdwinRogusky.jpg",
    body: File.read("db/experts/rogusky.html")
  },
  {
    first_name: "Thomas J.",
    last_name: "Ellis",
    suffix: "DO",
    phone: "(814) 231-2101",
    location: "State College & Altoona",
    specialty: "Sports Medicine, Total Joint Replacements, & Knee and Shoulder",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "ThomasEllis.jpg",
    body: File.read("db/experts/ellis.html")
  },
  {
    first_name: "William A.",
    last_name: "Tyndall",
    suffix: "MD PHD",
    phone: "(814) 949-4050",
    location: "Altoona, Huntingdon, Tyrone & DuBois",
    specialty: "Arthroscopy of the Shoulder, Elbow, Hip & Knee, Sports Medicine, Shoulder and Knee Replacements, General Orthopedics",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "WilliamTyndall.jpg",
    body: File.read("db/experts/tyndall.html")
  },
  {
    first_name: "Gregory M.",
    last_name: "Bailey",
    suffix: "DO",
    phone: "(814) 231-2101",
    location: "State College",
    specialty: "Orthopedic Spine Care",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "GregoryBailey.jpg",
    body: File.read("db/experts/bailey.html")
  },
  {
    first_name: "Bradley A.",
    last_name: "Barter",
    suffix: "DO",
    phone: "(814) 231-2101",
    location: "State College, Tyrone, and DuBois, PA",
    specialty: "Joint Replacement Surgery, Foot, Ankle, Knee, Hand, Trauma, and Pediatrics",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "BradleyBarter.jpg",
    body: File.read("db/experts/barter.html")
  },
  {
    first_name: "Christopher",
    last_name: "McClellan",
    suffix: "DO",
    phone: "(814) 949-4050",
    location: "Altoona, DuBois, Roaring Spring, & Bedford",
    specialty: "Primary hip/knee replacement, 
                  Revision hip/knee replacement, 
                  General Orthopedics, 
                  Sports Medicine",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "ChristopherMcClellan.jpg",
    body: File.read("db/experts/mc_clellan.html")
  },
  {
    first_name: "Joel A.",
    last_name: "Torretti",
    suffix: "MD",
    phone: "(814) 231-2101",
    location: "State College",
    specialty: "Orthopedic Spine Surgeon",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "JoelTorretti.jpg",
    body: File.read("db/experts/torretti.html")
  },
  {
    first_name: "Christopher J.",
    last_name: "Lincoski",
    suffix: "MD",
    phone: "(814) 231-2101",
    location: "State College & Altoona",
    specialty: "Total Joint Replacements, Hand and Wrist, General Orthopedics",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "ChristopherLincoski.jpg",
    body: File.read("db/experts/lincoski.html")
  },
  {
    first_name: "Paul R.",
    last_name: "Sensiba",
    suffix: "MD",
    phone: "(814) 231-2101",
    location: "State College, Lewistown, and DuBois",
    specialty: "Total Joint Replacements, Sports Medicine",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "PaulSensiba.jpg",
    body: File.read("db/experts/sensiba.html")
  },
  {
    first_name: "Todd B.",
    last_name: "Cousins",
    suffix: "DO",
    phone: "(814) 231-2101",
    location: "Geisinger Gray’s Woods, Port Matilda, PA",
    specialty: "Interventional Pain Management Specialist",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "ToddCousins.jpg",
    body: File.read("db/experts/cousins.html")
  },
  {
    first_name: "Fred K.",
    last_name: "Khalouf",
    suffix: "DO",
    phone: "(814) 949-4050",
    location: "Altoona",
    specialty: "Interventional Pain Management Specialist, 
                Anesthesiology, Pain Medicine",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "FredKhalouf.jpg",
    body: File.read("db/experts/khalouf.html")
  },
  {
    first_name: "Keith M.",
    last_name: "Zora",
    suffix: "DO",
    phone: "(814) 231-2101",
    location: "State College",
    specialty: "Interventional Pain Management Specialist",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "KeithZora.jpg",
    body: File.read("db/experts/zora.html")
  },
  {
    first_name: "Michael",
    last_name: "Doss",
    suffix: "DPM",
    phone: "(814) 949-4050",
    location: "Altoona & Huntingdon",
    specialty: "Reconstructive Foot and Ankle Surgery, Ilizarov & Peripheral Nerve Surgery, Diabetic Limb Salvage, Foot & Ankle Trauma",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "MichaelDoss.jpg",
    body: File.read("db/experts/doss.html")
  },
  {
    first_name: "Paul D.",
    last_name: "Lamb",
    suffix: "DC",
    phone: "(814) 231-2101",
    location: "State College",
    specialty: "Chiropractic Care",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "PaulLamb.jpg",
    body: File.read("db/experts/lamb.html")
  },
  {
    first_name: "David J.",
    last_name: "Bozak",
    suffix: "DO",
    phone: "(814) 949-4050",
    location: "Altoona",
    specialty: "Physical Medicine and Rehabilitation, 
                Electrodiagnostic Testing, 
                Ultrasound Guided Injections",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "david-j-bozak-do_0.jpg",
    body: File.read("db/experts/bozak.html")
  },
  {
    first_name: "Adam M.",
    last_name: "Budny",
    suffix: "DPM",
    phone: "(814) 949-4050",
    location: "Altoona & Roaring Spring, PA",
    specialty: "Foot and Ankle,
                Total Ankle Replacement",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "adam-m-budny-dpm.jpg",
    body: File.read("db/experts/budny.html")
  },
  {
    first_name: "Eric M.",
    last_name: "Kephart",
    suffix: "DO",
    phone: "(814) 949-4050",
    location: "Altoona & Roaring Spring, PA",
    specialty: "Primary Care Sports Medicine, Sports Concussion Management, & Non-operative Musculoskeletal Care",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "eric-m-kephart-do_0_0.jpg",
    body: File.read("db/experts/kephart.html")
  },
  {
    first_name: "Alexis N.",
    last_name: "Ley",
    suffix: "DPM",
    phone: "(814) 949-4050",
    location: "Altoona & Roaring Spring",
    specialty: "Foot & Ankle",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "dr-ley_0.jpg",
    body: File.read("db/experts/ley.html")
  },
  {
    first_name: "Joshua",
    last_name: "Port",
    suffix: "MD",
    phone: "(814) 949-4050",
    location: "Altoona",
    specialty: "Orthopedic Surgery, Shoulder Reconstruction, Sports Medicine",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "joshua-port-md-200x200_0.jpg",
    body: File.read("db/experts/port.html")
  }, 
  {
    first_name: "Angela W.",
    last_name: "Rowe",
    suffix: "DO FAOAO",
    phone: "(814) 949-4050",
    location: "Altoona & Roaring Spring",
    specialty: "Hip, Knee, Hand, Wrist, and Elbow Surgery, 
                Joint Replacement Surgery, 
                Fracture Care",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "rowe.jpg",
    body: File.read("db/experts/rowe.html")
  },
  {
    first_name: "Shawn C.",
    last_name: "Saylor",
    suffix: "DO",
    phone: "(814) 949-4050",
    location: "Altoona & Roaring Spring",
    specialty: "Primary Care Sports Medicine, Sports Concussion Management, Nonoperative Musculoskeletal Care",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "saylor.jpg",
    body: File.read("db/experts/saylor.html")
  },
  {
    first_name: "Robert J.",
    last_name: "Singer",
    suffix: "DO",
    phone: "(814) 942-1166",
    location: "Altoona & Roaring Spring",
    specialty: "Joint Replacement Surgery, Shoulder, Elbow, Knee, Hand  & Wrist Surgery, Fracture Care",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "singer.jpg",
    body: File.read("db/experts/singer.html")
  },
  {
    first_name: "Jonathan P.",
    last_name: "Van Kleunen",
    suffix: "MD",
    phone: "(814) 949-4050",
    location: "Altoona, Roaring Springs & Tyrone",
    specialty: "Hip Surgery, Joint Replacement Surgery, Sports Medicine",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "kleunen.jpg",
    body: File.read("db/experts/kleunen.html")
  },
  {
    first_name: "Christopher ",
    last_name: "Varacallo",
    suffix: "DO",
    phone: "(814) 231-2101",
    location: "DuBois",
    specialty: "Sports Medicine, Non-surgical Treatments, General Orthopedics",
    procedures: "",
    education: "",
    category: "physicians",
    image_url: "Varacallo.jpg",
    body: File.read("db/experts/varacallo.html")
  },
  # PHYSICIAN ASSISTANTS
  {
    first_name: "Brett J.",
    last_name: "Beech",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physicians_assistants",
    image_url: "BrettBeech.jpg",
    body: File.read("db/experts/beech.html")
  },
  {
    first_name: "Todd E.",
    last_name: "Brunermer",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physicians_assistants",
    image_url: "ToddBrunermer.jpg",
    body: File.read("db/experts/brunermer.html")
  },
  {
    first_name: "Erin",
    last_name: "Gilroy",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physicians_assistants",
    image_url: "ErinGilroy.jpg",
    body: File.read("db/experts/gilroy.html")
  },
  {
    first_name: "Jennifer M.",
    last_name: "Illig",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physicians_assistants",
    image_url: "JenniferIllig.jpg",
    body: File.read("db/experts/illig.html")
  },
  {
    first_name: "Shawn",
    last_name: "Kibe",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physicians_assistants",
    image_url: "ShawnKibe.jpg",
    body: File.read("db/experts/kibe.html")
  },
  {
    first_name: "Mark A.",
    last_name: "Kramer",
    suffix: "ATC, PA-C",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physicians_assistants",
    image_url: "MarkKramer.jpg",
    body: File.read("db/experts/kramer.html")
  },
  {
    first_name: "Heidi A.",
    last_name: "Murphy",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physicians_assistants",
    image_url: "HeidiMurphy.jpg",
    body: File.read("db/experts/murphy.html")
  },
  {
    first_name: "Aaron",
    last_name: "Thompson",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physicians_assistants",
    image_url: "AaronThompson.jpg",
    body: File.read("db/experts/thompson.html")
  },
  {
    first_name: "John M.",
    last_name: "Vargo Jr.",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physicians_assistants",
    image_url: "JohnVargo.jpg",
    body: File.read("db/experts/vargo.html")
  },
  {
    first_name: "Erin M.",
    last_name: "Veneziano",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physicians_assistants",
    image_url: "ErinVeneziano.jpg",
    body: File.read("db/experts/veneziano.html")
  },
  {
    first_name: "Jonathan D.",
    last_name: "Burns ",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physicians_assistants",
    image_url: "",
    body: File.read("db/experts/burns.html")
  },
  {
    first_name: "Leah",
    last_name: "Koval ",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physicians_assistants",
    image_url: "",
    body: File.read("db/experts/koval.html")
  },
  {
    first_name: "MaryAnn",
    last_name: "Lyons ",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physicians_assistants",
    image_url: "",
    body: File.read("db/experts/lyons.html")
  },
  {
    first_name: "Mark",
    last_name: "Maney",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physicians_assistants",
    image_url: "",
    body: File.read("db/experts/maney.html")
  },
  {
    first_name: "Nicholas",
    last_name: "Popchak",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physicians_assistants",
    image_url: "",
    body: File.read("db/experts/popchak.html")
  },
  {
    first_name: "Michael",
    last_name: "Reichert",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physicians_assistants",
    image_url: "",
    body: File.read("db/experts/reichert.html")
  },
  {
    first_name: "Brad",
    last_name: "Rickabaugh",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physicians_assistants",
    image_url: "",
    body: File.read("db/experts/rickabaugh.html")
  },
  {
    first_name: "David",
    last_name: "Vanchure",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physicians_assistants",
    image_url: "",
    body: File.read("db/experts/vanchure.html")
  },
  {
    first_name: "David",
    last_name: "Claar",
    suffix: "PA-C",
    phone: "(814) 942-1166",
    location: "Altoona",
    specialty: "",
    procedures: "",
    education: "",
    category: "physicians_assistants",
    image_url: "",
    body: File.read("db/experts/claar.html")
  },
  {
    first_name: "Vanessa R.",
    last_name: "Colquhoun",
    suffix: "PA-C",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physicians_assistants",
    image_url: "",
    body: File.read("db/experts/colquhoun.html")
  },
  {
    first_name: "Andrea",
    last_name: "Lacki",
    suffix: "PA-C",
    phone: "(814) 942-1166",
    location: "Altoona",
    specialty: "",
    procedures: "",
    education: "",
    category: "physicians_assistants",
    image_url: "",
    body: File.read("db/experts/lacki.html")
  },
  {
    first_name: "Anthony",
    last_name: "Damin",
    suffix: "PA-C",
    phone: "(814) 942-1166",
    location: "Altoona",
    specialty: "",
    procedures: "",
    education: "",
    category: "physicians_assistants",
    image_url: "",
    body: File.read("db/experts/damin.html")
  },
  # PHYSICAL THERAPISTS
  {
    first_name: "Elaine",
    last_name: "Barch",
    suffix: "PT, DPT, CHT, CEAS",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physical_therapists",
    image_url: "ElaineBarch.jpg",
    body: File.read("db/experts/barch.html")
  },
  {
    first_name: "Joe",
    last_name: "Brescia",
    suffix: "MS, OTR/L, CHT",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physical_therapists",
    image_url: "JosephBrescia.jpg",
    body: File.read("db/experts/brescia.html")
  },
  {
    first_name: "Colleen",
    last_name: "Cingle",
    suffix: "MSPT",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physical_therapists",
    image_url: "ColleenCingle.jpg",
    body: File.read("db/experts/cingle.html")
  },
  {
    first_name: "John",
    last_name: "Kravetz",
    suffix: "MPT",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physical_therapists",
    image_url: "JohnKravetz.jpg",
    body: File.read("db/experts/kravetz.html")
  },
  {
    first_name: "Mary Jo",
    last_name: "McClellan",
    suffix: "MPT",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
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
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physical_therapists",
    image_url: "PamelaMitchell.jpg",
    body: File.read("db/experts/mitchell.html")
  },
  {
    first_name: "Duane L.",
    last_name: "Peachy",
    suffix: "MS, PT",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physical_therapists",
    image_url: "DuanePeachy.jpg",
    body: File.read("db/experts/peachy.html")
  },
  {
    first_name: "Sonya",
    last_name: "Storll",
    suffix: "MPT",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physical_therapists",
    image_url: "SonyaStorll.jpg",
    body: File.read("db/experts/storll.html")
  },
  {
    first_name: "Christopher",
    last_name: "Szabat",
    suffix: "DPT, ATC, CSCS",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physical_therapists",
    image_url: "ChristopherSzabat.jpg",
    body: File.read("db/experts/szabat.html")
  },
  {
    first_name: "Brett",
    last_name: "Kudlawiec",
    suffix: "PT, DPT",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physical_therapists",
    image_url: "",
    body: File.read("db/experts/kudlawiec.html")
  },
  {
    first_name: "Shannon",
    last_name: "Scanlan",
    suffix: "PT, DPT",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physical_therapists",
    image_url: "",
    body: File.read("db/experts/scanlan.html")
  },
  {
    first_name: "Naomi",
    last_name: "Pennington",
    suffix: "DPT, OCS",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "physical_therapists",
    image_url: "",
    body: File.read("db/experts/pennington.html")
  },
  # ATHLETIC TRAINERS
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
    first_name: "Lauren",
    last_name: "Stout",
    suffix: "",
    phone: "",
    location: "Mifflin County",
    specialty: "",
    procedures: "",
    education: "",
    category: "athletic_trainers",
    image_url: "",
    body: " " #File.read("db/experts/krajewski.html")
  },
  {
    first_name: "Dylan",
    last_name: "Bowersox",
    suffix: "",
    phone: "",
    location: "Mifflin County",
    specialty: "",
    procedures: "",
    education: "",
    category: "athletic_trainers",
    image_url: "",
    body: " " #File.read("db/experts/krajewski.html")
  },
  {
    first_name: "Corbin",
    last_name: "Bird",
    suffix: "",
    phone: "",
    location: "Penn Valley",
    specialty: "",
    procedures: "",
    education: "",
    category: "athletic_trainers",
    image_url: "",
    body: " " #File.read("db/experts/krajewski.html")
  },
  {
    first_name: "Steven",
    last_name: "Murray",
    suffix: "",
    phone: "",
    location: "State College",
    specialty: "",
    procedures: "",
    education: "",
    category: "athletic_trainers",
    image_url: "",
    body: " " #File.read("db/experts/krajewski.html")
  },
  {
    first_name: "Sarah",
    last_name: "Shoaf",
    suffix: "",
    phone: "",
    location: "State College",
    specialty: "",
    procedures: "",
    education: "",
    category: "athletic_trainers",
    image_url: "",
    body: " " #File.read("db/experts/krajewski.html")
  },

  # CLINICAL RESEARCHERS
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
  },
  {
    first_name: "Connie",
    last_name: "Edsall",
    suffix: "",
    phone: "1-800-505-2101",
    location: "",
    specialty: "",
    procedures: "",
    education: "",
    category: "workers_comp",
    image_url: "ConnieEdsall.jpg",
    body: File.read("db/experts/edsall.html")
  },
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
  {
  title: "WTAJ, Doctors form New Partnership", 
  created_at: DateTime.strptime('01/15/2016', '%m/%d/%Y'),
  body: File.read("db/news/6.html")
  },
  {
  title: "Altoona Mirror, Orthopedic Practices to Merge", 
  created_at: DateTime.strptime('12/20/2015', '%m/%d/%Y'),
  body: File.read("db/news/7.html")
  },
  {
  title: "WTAJ, Same-day total joint surgery for Ecuador patient", 
  created_at: DateTime.strptime('10/31/2014', '%m/%d/%Y'),
  body: File.read("db/news/8.html")
  },
])
