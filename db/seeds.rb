# ABOUT
about = Page.create!(title: 'About')
about.children.create!(title: "History", position: 1)
about.children.create!(title: "Refer a Patient", position: 2)
about.children.create!(title: "Mission/Vision/Values", position: 3)
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
experts.children.create!(title: "Athletic Trainers", position: 6)
experts.children.create!(title: "Management", position: 7)

# SPECIALTIES
specialties = Page.create!(title: 'Specialties')
specialties.children.create!(title: "Spine", position: 1)
specialties.children.create!(title: "Pain Management", position: 2)
specialties.children.create!(title: "Chiropractic", position: 3)
specialties.children.create!(title: "Joint Replacements", position: 4)
specialties.children.create!(title: "Sports Medicine", position: 5)
specialties.children.create!(title: "Foot & Ankle", position: 6)
specialties.children.create!(title: "Hand", position: 7)
specialties.children.create!(title: "Gen Ortho", position: 8)
specialties.children.create!(title: "Pain Management", position: 9)


# SERVICES
services = Page.create!(title: 'Services')

outpatient = services.children.create!(title: "Outpatient Surgical Centers", position: 1)
outpatient.children.create!(title: "UOCSS", position: 1)
outpatient.children.create!(title: "Adv Center for Surgery", position: 2)

services.children.create!(title: "Urgent Ortho Care", position: 2)
services.children.create!(title: "Physical/Occupational Therapy", position: 3)

sports = services.children.create!(title: "Sports Medicine Services", position: 4)
sports.children.create!(title: "Athletic Trainers", position: 1)
sports.children.create!(title: "Concussion Care", position: 2)
sports.children.create!(title: "Saturday Sports Clinic", position: 3)
sports.children.create!(title: "Fellowships", position: 4)

services.children.create!(title: "Clinical Research", position: 5)
services.children.create!(title: "Worker’s Comp", position: 6)
services.children.create!(title: "MRI", position: 7)
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
careers = Page.create!(title: 'Careers')


# Old to remove

Page.create!([
  {
    title: "Specialties", 
    body: %{
      Dolor repellendus incidunt praesentium quo odio. Quod sit sed eum
      perspiciatis odit eaque nesciunt dolore veniam vitae provident. Quia officia
      perferendis aliquid ipsam consectetur? Ullam officiis quas recusandae
      perferendis soluta.
    }.squish
  },
  {
    title: "Services", 
    body: %{
      Dolor excepturi minima nam magni deleniti? In aliquid corporis est culpa
      expedita error. Voluptatum pariatur doloremque dolore quia voluptates eius.
      Totam cum suscipit vitae repellendus voluptates, cum expedita modi, eos.
    }.squish
  },
  {
    title: "Our Experts", 
    body: %{
      Dolor excepturi minima nam magni deleniti? In aliquid corporis est culpa
      expedita error. Voluptatum pariatur doloremque dolore quia voluptates eius.
      Totam cum suscipit vitae repellendus voluptates, cum expedita modi, eos.
    }.squish
  },
  {
    title: "News", 
    body: %{
      Dolor excepturi minima nam magni deleniti? In aliquid corporis est culpa
      expedita error. Voluptatum pariatur doloremque dolore quia voluptates eius.
      Totam cum suscipit vitae repellendus voluptates, cum expedita modi, eos.
    }.squish
  },
  {
    title: "Contact Us", 
    body: "This is the contact page"
  }
])
