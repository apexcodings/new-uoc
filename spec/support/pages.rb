def create_required_pages
  services = Page.create!(title: "Services")
  services.children.create!(title: "Sports", slug: "sports-medicine-services")
end
