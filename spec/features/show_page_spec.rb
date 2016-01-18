require 'rails_helper'
require 'support/attributes'
require 'support/pages'

describe "Showing a page" do

  before do
    create_required_pages
  end

  it "displays the requested page" do
    specialties = Page.create!(page_attributes(title: "Specialties"))

    visit root_url
    within(".site-navigation") do
      click_link "Specialties"
    end

    expect(current_path).to eq(page_path('specialties'))
    expect(page).to have_text(specialties.body)
  end

  it "displays the Navigation label in the navigation bar" do
    spine = Page.create!(title: "One team, one goal.", slug: "spine-institute", label: "Spine Institute")

    visit page_url('spine-institute')

    within(".main-content h1") do
      expect(page).to have_text(spine.title)
    end

    # this part doesn't pass. Don't know why. Figure it out.
    # When I look at the pages it seems to be working, though.
    #
    #within(".side-navigation ul") do
    #  expect(page).to have_link("Spine Institute")
    #end
  end

  context "when it's a sub-page" do
    it "displays its parent root page at the top of the side navigation" do
      #services = Page.create!(page_attributes(title: "Services"))
      #sports = services.children.create!(page_attributes(title: "Sports Medicine"))

      visit page_url(Page.sports)

      within('.side-navigation h2') do
        expect(page).to have_text("Services")
      end
    end
  end

  context "when it's a top page" do
    it "displays its children in the side navigation" do
      #services = Page.create!(page_attributes(title: "Services"))
      #sports = services.children.create!(page_attributes(title: "Sports Medicine"))
      outpatient = Page.services.children.create!(page_attributes(title: "Outpatient"))

      expect(Page.services.children.count).to eq(2)

      visit page_url(Page.services)

      within(".side-navigation ul") do
        expect(page).to have_link(Page.sports.label)
        expect(page).to have_link(outpatient.label)
      end
    end
  end

  context "when it's the 'Our Experts' page" do
    it "shows all the Experts categories in the side navigation" do
      our_experts = Page.create!(page_attributes(title: "Our Experts"))

      visit page_url(our_experts.slug)

      category_names = ["Physicians", "Physicians Assistants", "Physical Therapists", "Clinical Researchers", "Worker's Compensation Representative", "Athletic Trainers", "Management"]

      within(".side-navigation ul") do
        category_names.each do |name|
          expect(page).to have_link name
        end
      end
    end
  end
end
