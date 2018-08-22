# services = Page.find_by(slug: 'services')
#
# Page.create!(
#   title: 'UOC Healthy Weight & Wellness',
#   body: File.read("#{Rails.root}/db/pages/wellness-center.html"),
#   slug: 'wellness-center',
#   parent: services,
#   position: 10,
#   label: 'Wellness Center',
#   publish: false
# )

wellness = Page.find_by(slug: 'wellness-center')
wellness.update(
  body: File.read("#{Rails.root}/db/pages/wellness-center.html"),
  publish: true
)


# Slide.create!([
#   {
#     title: 'Your comeback starts here.',
#     description: "Whether it’s on the court, the track, the diamond, the field, the rink, around the house or on the job, everyone loves a comeback story. At University Orthopedics Center, we’re here to help you write yours.",
#     link_url: 'http://uoc.com/pages/contact-us',
#     link_title: 'Start your comeback today',
#     position: 1,
#     photo: File.open("#{Rails.root}/app/assets/images/UOC_carousel_01.jpg")
#   },
#   {
#     title: "We're growing.",
#     description: "University Orthopedics Center is expanding services in Central Pennsylvania. Some UOC locations within Altoona and Huntingdon are moving, but we’re not going far. We’re also excited to announce our new Ebensburg location.",
#     link_url: 'https://www.uoc.com/news_releases/233',
#     link_title: "See where we're going",
#     position: 2,
#     photo: File.open("#{Rails.root}/app/assets/images/UOC_moving_slide.jpg")
#   },
#   {
#     title: "A more complete approach to care.",
#     description: "In January of 2016, we joined together with Blair Orthopedics to create Central Pennsylvania’s premier orthopedic care center for a better, healthier you.",
#     link_url: 'https://www.uoc.com/news_releases',
#     link_title: "Read all about it",
#     position: 3,
#     photo: File.open("#{Rails.root}/app/assets/images/UOC_carousel_02.jpg")
#   },
#   {
#     title: "Supporting patients every step of the way.",
#     description: "Each patient’s journey back from injury is unique. When reaching your goals means additional resources are needed, we provide a complete range of surgical and non-surgical services for recovery.",
#     link_url: 'http://uoc.com/pages/services',
#     link_title: "Take your first steps towards better",
#     position: 4,
#     photo: File.open("#{Rails.root}/app/assets/images/UOC_carousel_03.jpg")
#   },
#   {
#     title: "Not all injuries are created equal.",
#     description: "Each patient’s journey back from injury is unique. When reaching your goals means additional resources are needed, we provide a complete range of surgical and non-surgical services for recovery.",
#     link_url: 'http://uoc.com/pages/services',
#     link_title: "Start your journey with us",
#     position: 5,
#     photo: File.open("#{Rails.root}/app/assets/images/UOC_carousel_04.jpg")
#   },
#   {
#     title: "Helping the best athletes get better.",
#     description: "For athletes of every level, injuries and pain are never part of the game plan. We’re here to help you get back to your peak performance and the game you love.",
#     link_url: 'http://uoc.com/pages/sports-medicine-services',
#     link_title: "Your comeback starts now",
#     position: 6,
#     photo: File.open("#{Rails.root}/app/assets/images/UOC_carousel_05.jpg")
#   },
#   {
#     title: "The right hands for your care.",
#     description: "University Orthopedics Center is home to the region’s top physicians, physician assistants, physical therapists, athletic trainers and clinical researchers dedicated to helping you live your best life.",
#     link_url: 'http://uoc.com/pages/our-experts',
#     link_title: "Meet the experts behind the care",
#     position: 7,
#     photo: File.open("#{Rails.root}/app/assets/images/UOC_carousel_06.jpg")
#   }
# ])
