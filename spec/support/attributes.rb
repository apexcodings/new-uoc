def page_attributes(overrides = {})
  {
    title: "Page title",
    body: %{ Adipisicing perferendis optio recusandae quas quam ipsam harum
            tempora quos fugiat obcaecati asperiores, vero ipsum iste
            perspiciatis ipsa laborum a officiis repudiandae ullam voluptatibus. 
            Modi aut libero dicta quibusdam illum. }.squish
  }.merge(overrides)
end

def user_attributes(overrides = {})
  {
    name: "Example User",
    email: "user@example.com",
    password: "secret",
    password_confirmation: "secret"
  }.merge(overrides)
end

def expert_attributes(overrides = {})
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
    image_url: "expert_default.png",
    body: "Lorem iusto nisi delectus exercitationem exercitationem architecto! Impedit placeat commodi odit nesciunt laudantium. Laboriosam temporibus omnis nesciunt debitis nihil. Pariatur possimus possimus adipisicing doloremque odio. Voluptates ipsam sunt sapiente modi."
  }.merge(overrides)
end

def contact_attributes(overrides = {})
  {
    first_name: "John",
    last_name: "Dillon",
    email: "contact@example.com",
    phone: "914 744-3366",
    message: "Sample message"
  }.merge(overrides)
end

def appointment_attributes(overrides = {})
  {
    requestor_first_name: "John",
    requestor_mi: "J.",
    requestor_last_name: "Dillon",
    requestor_phone_prefix: "914",
    requestor_phone: "744-3366",
    requestor_email: "cesare@maryandferrari.com",
    requestor_time_to_reach: "10:00 am",
    patient_first_name: "Mark",
    patient_mi: "D.",
    patient_last_name: "Stritto",
    patient_phone_prefix: "914",
    patient_phone: "744-3366",
    address1: "308 Green Ridge Drive",
    address2: "Apt. 1",
    city: "State College",
    us_state: "PA",
    zip: "16901",
    dob: "12-3-1962",
    gender: "M",
    injury_location: "Arm",
    injury_location_other: "Spine",
    injury_date: "12-3-2015",
    prior_treatment: false,
    x_ray: false,
    no_insurance: false,
    insurance_plan_name: "Bill me",
    insurance_policy_number: "xxx12355",
    preferred_location: "Altoona",
    preferred_day_mo: true,
    preferred_day_tu: false,
    preferred_day_we: true,
    preferred_day_th: true,
    preferred_day_fr: false,
    preferred_time_am: false,
    preferred_time_pm: true,
    appointment_type: "Orthopedics",
    questions: "Sample message"
  }.merge(overrides)
end

def news_attributes(overrides = {})
  {
    title: "News Release 1",
    body: %{ Adipisicing perferendis optio recusandae quas quam ipsam harum
            tempora quos fugiat obcaecati asperiores, vero ipsum iste
            perspiciatis ipsa laborum a officiis repudiandae ullam voluptatibus. 
            Modi aut libero dicta quibusdam illum. }.squish
  }.merge(overrides)
end

def referral_attributes(overrides = {})
  {
    practice: "Ortho plus",
    physician: "John Waine",
    name: "Jane Vaine",
    phone: "999 9990000",
    email: "physician@example.com",
    fax: "999 9990000",
    patient_name: "Billy Willy",
    dob: "8/7/28",
    patient_phone: "666 888 0000",
    patient_phone_alt: "666 888 0000",
    patient_email: "billy@example.com",
    employer: "Timothy Tim",
    insurance: "We save you",
    diagnosis: "I think he's dead",
    prior_surgery: false,
    workers_comp: false,
    bone_scan: true,
    bone_scan_where: "Hospital",
    ct_scan: false,
    ct_scan_where: "",
    mri: true,
    mri_where: "Hospital",
    emg: false,
    emg_where: "Doctor",
    x_rays: false,
    x_rays_where: "",
    cast: true,
    cast_where: "At the doctor",
    preferred_physician: "Dr. Sport",
    preferred_office: "Altoona",
    time_to_be_seen: "1-2 days"
  }.merge(overrides)
end



