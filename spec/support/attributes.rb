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
