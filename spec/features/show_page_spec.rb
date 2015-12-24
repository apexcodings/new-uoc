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

  it "displays its parent (root page) in the side navigation" do
    services = Page.create!(page_attributes(title: "Services"))
    sports = services.children.create!(page_attributes(title: "Sports Medicine"))

    visit page_url(sports.slug)

    within('.side-navigation h2') do
      expect(page).to have_text("Services")
    end
  end
end
