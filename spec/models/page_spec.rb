require 'rails_helper'
require 'support/attributes'

describe Page do
  it "is valid with page_attributes" do
    page = Page.new(page_attributes)
    expect(page.valid?).to eq(true)
  end

  it "requires a title" do
    page = Page.new(title: "")
    page.valid?
    expect(page.errors[:title].any?).to eq(true)
  end

  it "generates a slug when it's created" do
    page = Page.create!(title: "Welcome to UOC")
    expect(page.slug).to eq("welcome-to-uoc")
  end

  it "generates a navigation label from the title if one is not specified" do
    page = Page.create!(title: "Spine Institute")
    expect(page.label).to eq("Spine Institute")
  end

  it "requires a unique slug" do
    page1 = Page.create!(title: "Welcome to UOC")
    page2 = Page.new(slug: page1.slug)
    page2.valid?
    expect(page2.errors[:slug].first).to eq("has already been taken")
  end

  it "may have sub-pages" do
    page1 = Page.create!(page_attributes(title: "Parent"))
    sub_page = page1.children.create!(page_attributes(title: "Child"))

    expect(page1.children).to include(sub_page)
    expect(sub_page.parent).to eq(page1)
  end

  it "knows its side navigation" do
    page1 = Page.create!(page_attributes(title: "Parent"))
    sub_page1 = page1.children.create!(page_attributes(title: "Child 1"))
    sub_page2 = page1.children.create!(page_attributes(title: "Child 2"))

    expect(sub_page1.side_nav).to include(sub_page2)
  end

  it "orders its side navigation by position" do
    page1 = Page.create!(page_attributes(title: "Parent"))
    sub_page2 = page1.children.create!(page_attributes(title: "Child 2", position: 2))
    sub_page1 = page1.children.create!(page_attributes(title: "Child 1", position: 1))
    sub_page3 = page1.children.create!(page_attributes(title: "Child 3", position: 3))

    expected_side_nav = [sub_page1, sub_page2, sub_page3]

    expect(page1.side_nav).to eq(expected_side_nav)
  end

  it "knows when it's the 'Experts' page" do
    our_experts = Page.create!(page_attributes(title: "Our Experts"))

    expect(our_experts.experts?).to eq(true)
  end

  it "knows when it's not the 'Experts' page" do
    about = Page.create!(page_attributes(title: "About Us"))

    expect(about.experts?).to eq(false)
  end

  it "knows when it's the Sports Medicine page (in Services)" do
    sports = Page.create!(page_attributes(title: "Sports Medicine", slug: "sports-medicine-services"))

    expect(sports.sports_medicine?).to eq(true)
  end

  it "knows when it's not the Sports Medicine page (in Services)" do
    about = Page.create!(page_attributes(title: "About Us"))

    expect(about.sports_medicine?).to eq(false)
  end

  it "knows when it belongs to the 'portal' pages" do
    what = Page.create!(page_attributes(title: "What is NextMD?"))
    why = Page.create!(page_attributes(title: "Why NextMD?"))
    how = Page.create!(page_attributes(title: "How NextMD Works"))
    appointments = Page.create!(page_attributes(title: "Appointments", slug: "portal-appointments"))
    messaging = Page.create!(page_attributes(title: "Messaging"))
    faq = Page.create!(page_attributes(title: "FAQ"))

    pages = [what, why, how, appointments, messaging, faq]

    pages.each do |p|
      expect(p.in_portal?).to eq(true)
    end
  end

  it "knows when it does not belong to the 'portal' pages" do
    sports = Page.create!(page_attributes(title: "Sports Medicine", slug: "sports-medicine-services"))
    about = Page.create!(page_attributes(title: "About Us"))

    pages = [sports, about]

    pages.each do |p|
      expect(p.in_portal?).to eq(false)
    end
  end

  it "knows when it belongs to the Sports pages" do
    sports = Page.create!(title: "Sports Medicine", slug: "sports-medicine-services")
    athletic = sports.children.create!(title: "Athletic Trainers")
    concussion = sports.children.create!(title: "Concussion Care")
    saturday = sports.children.create!(title: "Saturday")
    fellowship = sports.children.create!(title: "Fellowship")

    sports_pages = [sports, athletic, concussion, saturday, fellowship]
    
    sports_pages.each do |sport_page|
      expect(sport_page.in_sports?).to eq(true)
    end
  end

  it "knows when it doesn't belong to the Sports pages" do
    sports = Page.create!(title: "Sports Medicine", slug: "sports-medicine-services")
    about = Page.create!(title: "About")
    history = about.children.create!(title: "History")

    non_sports_pages = [about, history]

    non_sports_pages.each do |non_sport_page|
      expect(non_sport_page.in_sports?).to eq(false)
    end
  end

  it "knows when it belongs to the Services pages" do
    sports = Page.create!(title: "Sports", slug: "sports-medicine-services")
    services = Page.create!(title: "Services")
    outpatient = services.children.create!(title: "Outpatient")
    uocss = outpatient.children.create!(title: "UOCSS")
    mri = services.children.create!(title: "MRI")

    services_pages = [services, outpatient, mri, uocss]

    services_pages.each do |service_page|
      expect(service_page.in_services?).to eq(true)
    end
  end

  it "knows when it doesn't belong to the Services pages" do
    services = Page.create!(title: "Services")
    about = Page.create!(title: "About")
    history = about.children.create!(title: "History")

    # although Sports Medicine pages are part of services they 
    # have a different background, so they shouldn't be returned by
    # in_services?
    sports = services.children.create!(title: "Sports", slug: "sports-medicine-services")
    athletic = sports.children.create!(title: "Athletic Trainers")

    non_services_pages = [about, history, sports, athletic]

    non_services_pages.each do |non_service_page|
      expect(non_service_page.in_services?).to eq(false)
    end
  end

  it "may redirect to another page" do
    page = Page.new(redirect_url: "/pages/contact-us")
    expect(page.redirect_url?).to be_truthy
  end

  it "if it doesn't redirect to another page it returns false" do
    page = Page.new(redirect_url: "")
    expect(page.redirect_url?).to be_falsey
  end

end
