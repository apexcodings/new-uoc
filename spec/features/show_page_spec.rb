require 'rails_helper'
require 'support/attributes'

describe "Showing a page" do
  it "displays the requested page" do
    specialties = Page.create!(page_attributes(title: "Specialties"))

    visit root_url
    within(".site-navigation") do
      click_link "Specialties"
    end

    expect(current_path).to eq(page_path('specialties'))
    expect(page).to have_text(specialties.body)
  end

  context "when it's a sub-page" do
    it "displays its parent root page at the top of the side navigation" do
      services = Page.create!(page_attributes(title: "Services"))
      sports = services.children.create!(page_attributes(title: "Sports Medicine"))

      visit page_url(sports.slug)

      within('.side-navigation h2') do
        expect(page).to have_text("Services")
      end
    end
  end

  context "when it's a top page" do
    it "displays its children in the side navigation" do
      services = Page.create!(page_attributes(title: "Services"))
      sports = services.children.create!(page_attributes(title: "Sports Medicine"))
      outpatient = services.children.create!(page_attributes(title: "Outpatient"))

      expect(services.children.count).to eq(2)

      visit page_url(services.slug)

      within(".side-navigation ul") do
        expect(page).to have_link(sports.title)
        expect(page).to have_link(outpatient.title)
      end
    end
  end
end
